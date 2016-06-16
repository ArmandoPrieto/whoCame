dataSource {
    pooled = true
    jmxExport = true
    driverClassName = "org.h2.Driver"
    username = "sa"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
//    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
    singleSession = true // configure OSIV singleSession mode
    flush.mode = 'manual' // OSIV session flush mode outside of transactional context
}

// environment specific settings
environments {
    development {
        dataSource {
         /*   dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
        */
			
		//	dialect = whoCame.ImprovedH2Dialect //Solve hibernate4 - mysql problem
			dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
			//url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
			
				pooled = true
				
				url = "jdbc:mysql://127.0.0.1/whoCame"
				driverClassName = "com.mysql.jdbc.Driver"
				username = "root"
				password = "root"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
        }
    }
	/*
	 * 
	 *  Root User: adminCRB6Pez
		Root Password: 3d6kGdGIZwfn
		Database Name: whocame
		Connection URL: mysql://$OPENSHIFT_MYSQL_DB_HOST:$OPENSHIFT_MYSQL_DB_PORT/
		127.8.167.130
	 * */
    production {
		
		
        dataSource {
			dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
			//url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
			
				pooled = true
				
				url = "jdbc:mysql://127.8.167.130:3306/whocame"
				
				driverClassName = "com.mysql.jdbc.Driver"
				username = "adminCRB6Pez"
				password = "3d6kGdGIZwfn"
			
				properties{
               // See http://grails.org/doc/latest/guide/conf.html#dataSource for documentation
               jmxEnabled = true
               initialSize = 5
               maxActive = 50
               minIdle = 5
               maxIdle = 25
               maxWait = 10000
               maxAge = 10 * 60000
               timeBetweenEvictionRunsMillis = 1800000
               minEvictableIdleTimeMillis = 1800000
               validationQuery = "SELECT 1"
               validationQueryTimeout = 3
               validationInterval = 15000
               testOnBorrow = true
               testWhileIdle = true
               testOnReturn = false
               jdbcInterceptors = "ConnectionState"
               defaultTransactionIsolation = java.sql.Connection.TRANSACTION_READ_COMMITTED
            }
        }
    }
}
