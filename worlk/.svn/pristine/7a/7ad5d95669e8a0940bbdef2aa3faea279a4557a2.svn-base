package com.vinbet.mobile.sys;

import java.util.Properties;
import java.util.Timer;
import java.util.TimerTask;

import javax.net.ssl.HostnameVerifier;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jasig.cas.client.proxy.ProxyGrantingTicketStorage;
import org.jasig.cas.client.validation.Assertion;
import org.jasig.cas.client.validation.Cas20ProxyReceivingTicketValidationFilter;

import com.vinbet.mobile.util.Constants;

/**
 * 继承SSO自带的过滤器:org.jasig.cas.client.validation.Cas20ProxyReceivingTicketValidationFilter,重写了initInternal方法
 * 
 * @author jagger
 */
public class CASValidationFilter extends Cas20ProxyReceivingTicketValidationFilter {

	@Override
	protected void initInternal(FilterConfig filterConfig) throws ServletException {
		Constants.sso_secondary_domain = filterConfig.getInitParameter("sso_secondary_domain");
		Constants.sso_port = filterConfig.getInitParameter("sso_port");
		super.initInternal(filterConfig);
	}

	@Override
	public void init() {
		super.init();
	}

	@Override
	public void destroy() {
		super.destroy();
	}

	@Override
	public void setProxyGrantingTicketStorage(ProxyGrantingTicketStorage storage) {
		super.setProxyGrantingTicketStorage(storage);
	}

	@Override
	public void setTimer(Timer timer) {
		super.setTimer(timer);
	}

	@Override
	public void setTimerTask(TimerTask timerTask) {
		super.setTimerTask(timerTask);
	}

	@Override
	public void setMillisBetweenCleanUps(int millisBetweenCleanUps) {
		super.setMillisBetweenCleanUps(millisBetweenCleanUps);
	}

	@Override
	protected HostnameVerifier getHostnameVerifier(FilterConfig filterConfig) {
		return super.getHostnameVerifier(filterConfig);
	}

	@Override
	protected Properties getSSLConfig(FilterConfig filterConfig) {
		return super.getSSLConfig(filterConfig);
	}

	@Override
	protected void onFailedValidation(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse) {
		super.onFailedValidation(httpservletrequest, httpservletresponse);
	}

	@Override
	protected void onSuccessfulValidation(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse, Assertion assertion1) {
		super.onSuccessfulValidation(httpservletrequest, httpservletresponse, assertion1);
	}

	@Override
	protected String retrieveTicketFromRequest(HttpServletRequest request) {
		return super.retrieveTicketFromRequest(request);
	}

	@Override
	public int hashCode() {
		return super.hashCode();
	}

	@Override
	public boolean equals(Object obj) {
		return super.equals(obj);
	}

	@Override
	protected Object clone() throws CloneNotSupportedException {
		return super.clone();
	}

	@Override
	public String toString() {
		return super.toString();
	}

	@Override
	protected void finalize() throws Throwable {
		super.finalize();
	}

}
