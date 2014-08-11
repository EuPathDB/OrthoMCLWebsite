package org.orthomcl.model.layout;

import org.eupathdb.common.model.InstanceManager;
import org.gusdb.wdk.model.Manageable;
import org.gusdb.wdk.model.WdkModelException;
import org.gusdb.wdk.model.WdkUserException;
import org.gusdb.wdk.model.record.RecordInstance;
import org.gusdb.wdk.model.user.User;
import org.json.JSONException;
import org.orthomcl.model.Group;
import org.orthomcl.model.GroupManager;

public class GroupLayoutManager extends LayoutManager implements Manageable<GroupLayoutManager> {

  private static final String LAYOUT_ATTRIBUTE = "layout";

  @Override
  public GroupLayoutManager getInstance(String projectId, String gusHome) throws WdkModelException {
    GroupLayoutManager layoutManager = new GroupLayoutManager();
    layoutManager.projectId = projectId;
    return layoutManager;
  }

  public Layout getLayout(User user, String name) throws WdkModelException, WdkUserException {
    GroupManager groupManager = InstanceManager.getInstance(GroupManager.class, projectId);
    RecordInstance groupRecord = groupManager.getGroupRecord(user, name);

    // load layout content
    String layoutString = (String) groupRecord.getAttributeValue(LAYOUT_ATTRIBUTE).getValue();
    if (layoutString == null)
      return null;

    // load group
    Group group = groupManager.getGroup(groupRecord);
    Layout layout = new Layout(group, getSize());

    try {
      loadLayout(layout, layoutString);

      return layout;
    }
    catch (JSONException ex) {
      throw new WdkModelException(ex);
    }
  }
}
