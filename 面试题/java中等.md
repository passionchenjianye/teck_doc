#### 中等题
1、Spring事务的隔离级别，并每个隔离级别的区别

2、Hibernate与Mybatis的比较

3、http的get和post方法性能上的区别

4、hibernate一级缓存和二级缓存的区别

  > hibernate的缓存包括Session的缓存和SessionFactory的缓存，其中SessionFactory
  的缓存又可以分为两类：内置缓存和外置缓存。Session的缓存是内置的，不能被卸载，也被称为
  Hibernate的第一级缓存。SessionFactory的内置缓存中存放了映射元数据和预定义SQL语句，
  映射元数据是映射文件中数据的拷贝，而预定义SQL语句是在Hibernate初始化阶段根据映射元数据
  推导出来，SessionFactory的内置缓存是只读的，应用程序不能修改缓存中的映射元数据和预定义
  SQL语句，因此SessionFactory不需要进行内置缓存与映射文件的同步。SessionFactory的外置
  缓存是一个可配置的插件。在默认情况下，SessionFactory不会启用这个插件。外置缓存的数据是
  数据库数据的拷贝，外置缓存的介质可以是内存或者硬盘。SessionFactory的外置缓存也被称
  为Hibernate的第二级缓存。


5、缓存的范围和并发访问策略



