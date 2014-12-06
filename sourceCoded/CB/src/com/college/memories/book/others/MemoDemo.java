package com.college.memories.book.others;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;

import com.college.memories.book.dto.MemoriesSnapsBeans;
import com.college.memories.book.services.CollegebookCommons;

public class MemoDemo 
{
	static int snapId=0;
	static String snapName=null;
	public static void main(String[] args) 
	{
		String sqlQuery="select * from collegeBook.memoriesSnapDetails order by snapid desc;"; 
	   	 ArrayList<MemoriesSnapsBeans> snapDetails= CollegebookCommons.memoriesSnapsDetails(sqlQuery); //Static Method.
	   	 Iterator<MemoriesSnapsBeans> snapDetailsIt=snapDetails.iterator();
	   	 
	   	 HashMap<Integer, MemoriesSnapsBeans> lst= new HashMap<>();
	   	 while(snapDetailsIt.hasNext())
	   	 {
	   		 MemoriesSnapsBeans memoriesSnapsBeans=(MemoriesSnapsBeans) snapDetailsIt.next(); 
	
	   		 	 snapId=memoriesSnapsBeans.getSnapId();
				 snapName=memoriesSnapsBeans.getSnapName();
				 String uplaodedUserName=memoriesSnapsBeans.getUploadedUserName();
				 String uploadedFriendName=memoriesSnapsBeans.getUploadedFriendName();
				 String uploadedDate=memoriesSnapsBeans.getUploadedDate();
				 String uploadedtime=memoriesSnapsBeans.getUploadedTime();
				 
			//	 System.out.println(snapName);
				 
				 lst.put(snapId, memoriesSnapsBeans);
	   	 }
	   	 
	   	 Collection<MemoriesSnapsBeans> val= lst.values();
	   	 for (MemoriesSnapsBeans m :val) 
	   	 {
	   		 	System.out.println(m.getSnapName()+" "+ m.getUploadedFriendName()+" "+ m.getSnapId());
	   	 }
//	   	 System.out.println(" Snap is " +val);
	   	 
//	   	 Collection l=lst.values();
//	   	 for (Object object : l) {
//			System.out.println(object);
//		}
	   	// System.out.println(l);

	}
}
