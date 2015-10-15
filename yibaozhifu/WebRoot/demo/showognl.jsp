<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>  
  
<%@ taglib prefix="s" uri="/struts-tags" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/ xhtml1/DTD/xhtml1-transitional.dtd">  
  
<html xmlns="http://www.w3.org/1999/xhtml">  
  
<head>  
  
    <title>Struts2 OGNL 演示</title>  
  
</head>  
  
<body>      
  
    <h3>访问OGNL上下文和Action上下文</h3>  
  
    <!-使用OGNL访问属性值-->  
  
    <p>parameters: <s:property value="#parameters.msg" /></p>  
  
    <p>request.msg: <s:property value="#request.msg" /></p>  
  
    <p>session.msg: <s:property value="#session.msg" /></p>  
  
    <p>application.msg: <s:property value="#application.msg" /></p>  
  
    <p>attr.msg: <s:property value="#attr.msg" /></p>  
  
    <hr />  
  
    <h3>用于过滤和投影(projecting)集合</h3>  
  
    <p>年龄大于20</p>  
  
    <ul>  
  
    <!-判断年龄-->  
  
        <s:iterator value="persons.{?#this.age>20}">  
  
            <li><s:property value="name" /> - 年龄：<s:property value="age" /></li>  
  
        </s:iterator>  
  
    </ul>  
  
    <p>姓名为pla1的年龄: <s:property value="persons.{?#this.name=='pla1'}.{age}[0]"/></p>  
  
    <hr />  
  
    <h3>构造Map</h3>  
  
    <s:set name="foobar" value="#{'foo1':'bar1', 'foo2':'bar2'}" />  
  
    <p>The value of key "foo1" is <s:property value="#foobar['foo1']" /></p>  
  	
  	<hr /> 
  	
  	<h4>%符号的用法</h4>  
  
    <s:set name="foobar" value="#{'foo1':'bar1', 'foo2':'bar2'}" />  
  
    <p>The value of key "foo1" is <s:property value="#foobar['foo1']" /></p>  
  
    <p>不使用％：<s:url value="#foobar['foo1']" /></p>  
  
    <p>使用％：<s:url value="%{#foobar['foo1']}" /></p>  
  
  	<hr />
   		<%  
            request.setAttribute("req", "request scope");  
            request.getSession().setAttribute("sess", "session scope");  
            request.getSession().getServletContext().setAttribute("app",  
                    "aplication scope");  
        %>  
   		1.通过ognl表达式获取 属性范围中的值  
        <br>  
        <s:property value="#request.req" />  
        <br />  
        <s:property value="#session.sess" />  
        <br />  
        <s:property value="#application.app" />  
        <br />  
        <hr>  
  
       2.通过<span style="background-color: #fafafa;">ognl表达式创建list 集合 ，并且遍历出集合中的值  
        <br>  
        <s:set name="list" value="{'eeeee','ddddd','ccccc','bbbbb','aaaaa'}"></s:set>  
        <s:iterator value="#list" var="o">  
            <!-- ${o }<br/> -->  
            <s:property />  
            <br />  
        </s:iterator>  
        <br />  
        <hr>  
  
       3.通过ognl表达式创建Map 集合 ，并且遍历出集合中的值  
        <br>  
        <s:set name="map"  
            value="#{'1':'eeeee','2':'ddddd','3':'ccccc','4':'bbbbb','5':'aaaaa'}"></s:set>  
        <s:iterator value="#map" var="o">  
            <!--      ${o.key }->${o.value }<br/>   -->  
            <!-- <s:property value="#o.key"/>-><s:property value="#o.value"/><br/>   -->  
            <s:property value="key" />-><s:property value="value" />  
            <br />  
        </s:iterator>  
        <br />  
        <hr>  
      4.通过ognl表达式 进行逻辑判断  
        <br>  
        <s:if test="'aa' in {'aaa','bbb'}">  
            aa 在 集合{'aaa','bbb'}中；  
        </s:if>  
        <s:else>  
            aa 不在 集合{'aaa','bbb'}中；  
        </s:else>  
        <br />  
        <s:if test="#request.req not in #list">  
            	不 在 集合list中；  
        </s:if>  
        <s:else>  
           	 在 集合list中；  
        </s:else>  
        <br />  
        <hr>  
        
       5.通过ognl表达式 的投影功能进行数据筛选  
        <br>  
        <s:set name="list1" value="{1,2,3,4,5}"></s:set>  
        <s:iterator value="#list1.{?#this>2}" var="o">  
            <!-- #list.{?#this>2}：在list1集合迭代的时候，从中筛选出当前迭代对象>2的集合进行显示 -->  
            ${o }<br />  
        </s:iterator>  
        <br />  
        <hr>  
       6.通过ognl表达式 访问某个类的静态方法和值  
        <br>  
        <s:property value="@java.lang.Math@floor(32.56)" />  
  
        <s:property value="@com.rao.struts2.action.OGNL1Action@aa" />  
        <br />  
        <br />  
        <hr>  
      7.ognl表达式 迭代标签 详细  
        <br>  
        <s:set name="list2"  
            value="{'aa','bb','cc','dd','ee','ff','gg','hh','ii','jj'}"></s:set>  
        <table border="1">  
            <tr>  
                <td>索引 </td>  
                <td>值</td>  
                <td>奇？</td>  
                <td> 偶？</td>  
                <td>首？</td>  
                <td> 尾？</td>  
                <td>当前迭代数量</td>  
            </tr>  
            <s:iterator value="#list2" var="o" status="s">  
                <tr bgcolor="<s:if test="#s.even">pink</s:if>">  
                    <td>  
                        <s:property value="#s.getIndex()" />  
                    </td>  
                    <td>  
                        <s:property />  
                    </td>  
                    <td>  
                        <s:if test="#s.odd">Y</s:if>  
                        <s:else>N</s:else>  
                    </td>  
                    <td>  
                        <s:if test="#s.even">Y</s:if>  
                        <s:else>N</s:else>  
                    </td>  
                    <td>  
                        <s:if test="#s.first">Y</s:if>  
                        <s:else>N</s:else>  
                    </td>  
                    <td>  
                        <s:if test="#s.isLast()">Y</s:if>  
                        <s:else>N</s:else>  
                    </td>  
                    <td>  
                    <s:property value="#s.getCount()"/>  
                </td>  
                </tr>  
            </s:iterator>  
        </table>  
        <br>  
        <hr>       
        
        
       8.ognl表达式:  if/else if/else 详细<br>  
        <% request.setAttribute("aa",0); %>  
        <s:if test="#request.aa>=0 && #request.aa<=4">  
            	在0-4之间；  
        </s:if>  
        <s:elseif test="#request.aa>=4 && #request.aa<=8">  
            	在4-8之间；  
        </s:elseif>  
        <s:else>  
           	 大于8；  
        </s:else>  
        <br>  
        <hr>  
    9.ognl表达式: url 详细<br>  
        <% request.setAttribute("aa","sss"); %>  
        <s:url action="testAction" namespace="/aa/bb">  
            <s:param name="aa" value="#request.aa"></s:param>  
            <s:param name="id">100</s:param>  
        </s:url>  
        <br/>  
        <s:set name="myurl" value="'http://www.baidu.com'"></s:set>  
        value以字符处理：   <s:url value="#myurl"></s:url><br>  
        value明确指定以ognl表达式处理:    <s:url value="%{#myurl}"></s:url>  
        <br>  
        <hr>  
    10.ognl表达式: checkboxlist 详细<br>  
        1> .list 生成；~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>  
        name:checkboxlist的名字<br>  
        list:checkboxlist要显示的列表<br>  
        value:checkboxlist默认被选中的选项,checked=checked<br>  
        <s:checkboxlist name="checkbox1" list="{'上网','看书','爬山','游泳','唱歌'}" value="{'上网','看书'}" ></s:checkboxlist>  
        <br>  
       	 以上生成代码：<br>  
        <xmp>  
            <input type="checkbox" name="checkbox1" value="上网" id="checkbox1-1" checked="checked"/>  
            <label for="checkbox1-1" class="checkboxLabel">上网</label>  
            <input type="checkbox" name="checkbox1" value="看书" id="checkbox1-2" checked="checked"/>  
            <label for="checkbox1-2" class="checkboxLabel">看书</label>  
            <input type="checkbox" name="checkbox1" value="爬山" id="checkbox1-3"/>  
            <label for="checkbox1-3" class="checkboxLabel">爬山</label>  
            <input type="checkbox" name="checkbox1" value="游泳" id="checkbox1-4"/>  
            <label for="checkbox1-4" class="checkboxLabel">游泳</label>  
            <input type="checkbox" name="checkbox1" value="唱歌" id="checkbox1-5"/>  
            <label for="checkbox1-5" class="checkboxLabel">唱歌</label>"  
        </xmp>  
        2> .Map 生成；~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>  
        name:checkboxlist的名字<br>  
        list:checkboxlist要显示的列表<br>  
        listKey:checkbox 的value的值<br>  
        listValue:checkbox 的lablel(显示的值)<br>  
        value:checkboxlist默认被选中的选项,checked=checked<br>  
        <s:checkboxlist name="checkbox2" list="#{1:'上网',2:'看书',3:'爬山',4:'游泳',5:'唱歌'}" listKey="key" listValue="value" value="{1,2,5}" ></s:checkboxlist>  
        <br>  
                       以上生成代码：<br>  
        <xmp>  
            <input type="checkbox" name="checkbox2" value="1" id="checkbox2-1" checked="checked"/>  
            <label for="checkbox2-1" class="checkboxLabel">上网</label>  
            <input type="checkbox" name="checkbox2" value="2" id="checkbox2-2" checked="checked"/>  
            <label for="checkbox2-2" class="checkboxLabel">看书</label>  
            <input type="checkbox" name="checkbox2" value="3" id="checkbox2-3"/>  
            <label for="checkbox2-3" class="checkboxLabel">爬山</label>  
            <input type="checkbox" name="checkbox2" value="4" id="checkbox2-4"/>  
            <label for="checkbox2-4" class="checkboxLabel">游泳</label>  
            <input type="checkbox" name="checkbox2" value="5" id="checkbox2-5" checked="checked"/>  
            <label for="checkbox2-5" class="checkboxLabel">唱歌</label>  
        </xmp>  
        <hr>  
</body>  
</html>  