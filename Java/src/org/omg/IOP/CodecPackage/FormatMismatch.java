package org.omg.IOP.CodecPackage;


/**
* org/omg/IOP/CodecPackage/FormatMismatch.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from /HUDSON/workspace/8-2-build-linux-amd64/jdk8u5/2488/corba/src/share/classes/org/omg/PortableInterceptor/IOP.idl
* Tuesday, March 18, 2014 12:30:01 AM PDT
*/

public final class FormatMismatch extends org.omg.CORBA.UserException
{

  public FormatMismatch ()
  {
    super(FormatMismatchHelper.id());
  } // ctor


  public FormatMismatch (String $reason)
  {
    super(FormatMismatchHelper.id() + "  " + $reason);
  } // ctor

} // class FormatMismatch
