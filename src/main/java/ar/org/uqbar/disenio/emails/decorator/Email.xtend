package ar.org.uqbar.disenio.emails.decorator

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Email {
	String from
	String to
	String subject
	String content
}