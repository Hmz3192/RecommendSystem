package com.hmz.utils;

import com.hmz.model.ArticleRating;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

public class FileUtil {
    private static final String COLON_DELIMTER = "::";

    public static File write2Dat(List<ArticleRating> articleRating) throws IOException {
        File originalFile = new File("E:\\WorkSpace\\IdeaWorkSpace\\RecommendSystem\\src\\main\\resources\\rating.dat");
        if (!originalFile.exists()) {
            originalFile.createNewFile();
        }

        try {
            FileWriter writer1 = new FileWriter(originalFile.getAbsoluteFile());
            BufferedWriter bufferWritter = new BufferedWriter(writer1);
            for (int i = 0; i < articleRating.size(); i++) {
                String line = "";
                line = line + articleRating.get(i).getUserId();
                line = line + COLON_DELIMTER + articleRating.get(i).getArticleId();
                line = line + COLON_DELIMTER + articleRating.get(i).getRating();
                line = line + COLON_DELIMTER + "975635394" + "\n";
                bufferWritter.write(line);
            }
            bufferWritter.close();
        } catch (IOException ioe) {
            originalFile.delete();
            throw ioe;
        }


        return originalFile;
    }
}
