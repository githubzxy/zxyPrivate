package com.yz.center.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
/**
 * Environment class simulates the System.getenv() method which is deprecated on
 * java 1.4.2
 * 
 * @author v-josp
 */
public class EnvRoot {
	
	public EnvRoot(){
		init();
	}
	
	private  BufferedReader commandResult;

	private  void init() {
		String cmd = null;
		String os = null;

		// getting the OS name
		os = System.getProperty("os.name").toLowerCase();

		// according to OS set the command to execute
		if (os.startsWith("windows")) {
			cmd = "cmd /c SET";
		} else {
			cmd = "env";
		}

		try {
			// execute the command and get the result in the form of InputStream
			Process p = Runtime.getRuntime().exec(cmd);

			// parse the InputStream data
			InputStreamReader isr = new InputStreamReader(p.getInputStream());
			commandResult = new BufferedReader(isr);
		} catch (Exception e) {
			System.out.println("OSEnvironment.class error: " + cmd + ":" + e);
		}
	}

	/**
	 * This method is used to get the path of the given enviornment variable.
	 * This method tries to simulates the System.getenv() which is deprecated on
	 * java 1.4.2
	 * 
	 * @param String
	 *            - name of the environment variable
	 * @param String
	 *            - default value
	 * @return
	 */
	public  String getenv(String envName, String defaultValue) {
		String line = null;
		System.out.println(commandResult.toString());
		try {
			while ((line = commandResult.readLine()) != null) {
				if (line.indexOf(envName) > -1) {
					return line.substring(line.indexOf(envName)
							+ envName.length() + 1);
				}
			}
			return defaultValue;
		} catch (Exception e) {
			e.printStackTrace();
			return defaultValue;
		}
	}

	public static void main(String args[]) {
		System.out.println(new EnvRoot().getenv("TOMCAT_HOME", ""));
		System.out.println(new EnvRoot().getenv("TOMCAT_HOME", ""));
		
	}
}