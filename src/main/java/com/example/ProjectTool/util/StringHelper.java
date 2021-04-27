package com.example.ProjectTool.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringHelper {
    public static boolean isImage(String filename) {

        if (filename != null && !filename.isEmpty()) {
            String filenameExtension = "";
            int isExtensionExist = filename.lastIndexOf('.');

            if (isExtensionExist > 0) {
                filenameExtension = filename.substring(isExtensionExist + 1);
            }

            Pattern pattern = Pattern.compile("jpg|jpeg|gif|png");
            Matcher matcher = pattern.matcher(filenameExtension);

            System.out.println(filenameExtension + " kek");

            return matcher.matches();
        }

        return false;
    }

}
