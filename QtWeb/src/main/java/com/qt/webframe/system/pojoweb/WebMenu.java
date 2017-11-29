package com.qt.webframe.system.pojoweb;

import java.util.List;

/**
 * @Desc
 * Created by Slash on 2017/5/24.
 */
public class WebMenu {

    private String id;

    private String name;

    private String url;

    private String parentId;

    private List<WebMenu> subMenus;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public List<WebMenu> getSubMenus() {
        return subMenus;
    }

    public void setSubMenus(List<WebMenu> subMenus) {
        this.subMenus = subMenus;
    }
}
