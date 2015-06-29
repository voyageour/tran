package com.corporate.transport.ldap;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.PropertyResourceBundle;
import java.util.ResourceBundle;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;

public class LDAPAuthentication {

	public Boolean authenticate(String username, String password) throws NamingException, IOException
	{
		
		Hashtable authEnv = new Hashtable();

/*		String mcEnvKeyPath = "MC_ENV_PATH";
		String envPropPath = System.getenv(mcEnvKeyPath);
		System.out.println("Path is 1 :"+envPropPath);
		
		String propertyFilePath = envPropPath + "ldap.properties";
		System.out.println("Path is 2 :"+propertyFilePath);
		
		if (envPropPath == null) {
			System.out.println("envPropPath os :"+envPropPath);
			envPropPath = System.getProperty(mcEnvKeyPath);
			System.out.println("envPropPath os 1:"+envPropPath);
		}
		
		System.out.println("Environment variable path to read is :"+envPropPath);
*/		ResourceBundle rb = null;
		URL url = LDAPAuthentication.class.getResource("ldap.properties");
		InputStream stream = LDAPAuthentication.class.getResourceAsStream("ldap.properties");
		try {
			File file = new File(url.getPath());
			if (file.exists()) {
				rb = new PropertyResourceBundle(stream);
				String[] urls = rb.getString("url").split(",");
				List ldapURLs = new ArrayList();
				Collections.addAll(ldapURLs, urls);
				/*authEnv.put("java.naming.factory.initial", rb.getString("INITIAL_CONTEXT_FACTORY"));
				authEnv.put("java.naming.security.authentication", rb.getString("SECURITY_AUTHENTICATION"));
				authEnv.put("java.naming.security.principal", username);
				authEnv.put("java.naming.security.credentials", password);
*/
				 String Securityprinciple = "cn="+username+","+rb.getString("UserSearch");
				 authEnv.put(Context.INITIAL_CONTEXT_FACTORY,rb.getString("INITIAL_CONTEXT_FACTORY"));
		         authEnv.put(Context.SECURITY_AUTHENTICATION, rb.getString("SECURITY_AUTHENTICATION"));
		         authEnv.put(Context.SECURITY_PRINCIPAL,Securityprinciple);
		         authEnv.put(Context.SECURITY_CREDENTIALS, password);
				
				Iterator itr = ldapURLs.iterator();

				while (itr.hasNext()) {
					authEnv.put(Context.PROVIDER_URL, itr.next().toString());
					try {
						if(authencicate(authEnv)) {
							return Boolean.TRUE;
						}
					} catch (NamingException e) {
						throw e;
					}
				}
			}
		}
		catch (FileNotFoundException e) {
			throw e;
		} catch (IOException e) {
			throw e;
		} finally {
			try {
				if (stream != null) {
					stream.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return Boolean.FALSE;
	}

	private Boolean authencicate(Hashtable authEnv) throws NamingException {
		System.out.println("Connecting to:" + authEnv.get("java.naming.provider.url"));
		Boolean b = Boolean.FALSE;
		try
		{
			DirContext authContext = new InitialDirContext(authEnv);
			b = Boolean.TRUE;
			authContext.close();
		} catch (NamingException ex) {
			throw ex;
		} 
		return b;
	}
}