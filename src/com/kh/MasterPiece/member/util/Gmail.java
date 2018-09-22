package com.kh.MasterPiece.member.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator{
   @Override
   protected PasswordAuthentication getPasswordAuthentication(){
      return new PasswordAuthentication("masterpieceTest1@gmail.com", "aktmxjvltm1!");
   }
}
