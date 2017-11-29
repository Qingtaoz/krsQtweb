package com.qt.webframe.system.service;

import com.qt.webframe.system.common.SysParams;
import com.qt.webframe.system.dao.*;
import com.qt.webframe.system.pojo.*;
import com.qt.webframe.system.pojoweb.OrgAndManager;
import com.qt.webframe.system.pojoweb.WebMenu;
import com.qt.webframe.system.utils.IdGenerator;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Description:
 * Created by Slash on 2017/5/18.
 */
@Service
public class SysService {

    @Resource
    private UserMapper userMapper;

    @Resource
    private MenuMapper menuMapper;

    @Resource
    private UTokenMapper uTokenMapper;

    @Resource
    private OptMapper optMapper;

    @Resource
    private OrganizationMapper organizationMapper;

    @Resource
    private RoleMapper roleMapper;

    @Resource
    private R_user_roleMapper rUserRoleMapper;


    /**
     * 根据token获取用户userid
     * @param token 用户token
     * @return 用户id
     */
    public String getUseridByToken(String token) {
        UToken t = uTokenMapper.selectUserIdByToken(token);
        if (t==null){
            return "";
        }
        if (((new Date()).getTime()-(t.getCreatedatetime()).getTime())>t.getExpirydate()*1000){
            return "";
        }
        return t.getUserid();
    }

    /**
     * 检测用户操作合法性
     * @param userid
     * @param strAuth
     * @return
     */
    public boolean checkUserAuth(String userid, String strAuth) {
        List<Opt> list = getOptListByUserid(userid);
        for (Opt o :
                list) {
            if (o.getOptcode().equals(strAuth)){
                return true;
            }
        }
        return false;
    }

    /**
     * 获取用户功能操作列表
     * @param userid
     * @return
     */
    public List<Opt> getOptListByUserid(String userid){
        List<Opt> list = optMapper.selectUserOptListByUserid(userid);
        return list;
    }

    /**
     * 校验用户名密码
     * @param username
     * @param password
     * @return
     */
    public User getUserByUsernamePassword(String username, String password) {
        return userMapper.selectByUsernamePassword(username, password);
    }

    /**
     * 获取用户菜单
     * @param userid
     * @return
     */
    public List<WebMenu> getUserMenusByUserId(String userid) {
        List<Menu> menus = menuMapper.selectUserMenusByUserId(userid);
        List<WebMenu> webMenus1 = new ArrayList<>();
        List<WebMenu> webMenus2 = new ArrayList<>();
        List<WebMenu> webMenus3 = new ArrayList<>();
        WebMenu webMenu;
        for (Menu m :
                menus) {
            webMenu = new WebMenu();
            if (m.getMenulevel()==1){
                webMenu.setId(m.getMenuid());
                webMenu.setName(m.getMenuname());
                webMenus1.add(webMenu);
            }
            if (m.getMenulevel()==2){
                webMenu.setId(m.getMenuid());
                webMenu.setName(m.getMenuname());
                webMenu.setParentId(m.getParentmenuid());
                webMenus2.add(webMenu);
            }
            if (m.getMenulevel()==3){
                webMenu.setId(m.getMenuid());
                webMenu.setName(m.getMenuname());
                webMenu.setParentId(m.getParentmenuid());
                webMenu.setUrl(m.getMenuurl());
                webMenus3.add(webMenu);
            }
        }
        for (WebMenu wm1 :
                webMenus1) {
            wm1.setSubMenus(new ArrayList<WebMenu>());
            for (WebMenu wm2:
                 webMenus2) {
                wm2.setSubMenus(new ArrayList<WebMenu>());
                for (WebMenu wm3:
                     webMenus3) {
                    if (wm3.getParentId().equals(wm2.getId())){
                        wm2.getSubMenus().add(wm3);
                    }
                }
                if (wm2.getParentId().equals(wm1.getId())){
                    wm1.getSubMenus().add(wm2);
                }
            }
        }
        return webMenus1;
    }

    /**
     * 添加或者更新用户登录TOKEN状态
     * @param userid
     * @param token
     * @return
     */
    @Transactional
    public void addUserToken(String userid, String token) {
        UToken ut = uTokenMapper.selectByPrimaryKey(userid);
        if (ut!=null){
            ut.setToken(token);
            ut.setCreatedatetime(new Date());
            if(uTokenMapper.updateByPrimaryKey(ut)==0){
                throw new RuntimeException();
            }
        }else{
            ut = new UToken();
            ut.setUserid(userid);
            ut.setToken(token);
            ut.setCreatedatetime(new Date());
            ut.setExpirydate(SysParams.TOKEN_EXPIRYDATE);
            if(uTokenMapper.insert(ut)==0){
                throw new RuntimeException();
            }
        }
    }

    /**
     * 初始化组织，设置组织管理员
     * @param orgAndManager
     * @param actionUserid
     * @return
     */
    @Transactional
    public void addorgandmanager(OrgAndManager orgAndManager, String actionUserid) {
        User user = new User();
        user.setUserid(IdGenerator.getUUID());
        user.setUsername(orgAndManager.getMangerName());
        user.setPassword(orgAndManager.getManagerPassWord());
        user.setNickname(orgAndManager.getManagerNickName());
        user.setIsforbidden(false);
        user.setIsdel(false);
        user.setCreateuserid(actionUserid);
        user.setCreatedatetime(new Date());
        if (userMapper.insertSelective(user)==0){
            throw new RuntimeException();
        }
        R_user_role rUserRole = new R_user_role();
        rUserRole.setUserid(user.getUserid());
        rUserRole.setRoleid(roleMapper.selectRoleIdByName(SysParams.ROLE_ORG_MANAGER).getRoleid());
        if (rUserRoleMapper.insert(rUserRole)==0){
            throw new RuntimeException();
        }
        Organization organization = new Organization();
        organization.setOrgid(IdGenerator.getUUID());
        organization.setOrgname(orgAndManager.getOrgName());
        organization.setOrgmanaerid(user.getUserid());
        organization.setIsdel(false);
        organization.setCreateuserid(actionUserid);
        organization.setCreatedatetime(new Date());
        if (organizationMapper.insertSelective(organization)==0){
            throw new RuntimeException();
        }
    }

    /**
     * 获取组织名称
     * @return
     */
    public String getOrgName() {
        Organization organizations = organizationMapper.selectCurrentOrg();
        if (organizations!=null){
            return organizations.getOrgname();
        }
        return null;
    }
}
