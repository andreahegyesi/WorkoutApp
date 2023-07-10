package com.repository;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.model.Category;
import com.model.WgerExercise;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;
public class WGERApiReader {
    ArrayList <WgerExercise> wgerExerciseList = new ArrayList<>();
    public ArrayList<WgerExercise> getExercisesFromWGER() {
        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create("https://wger.de/api/v2/exercisebaseinfo/?limit=400&offset=00"))
                .build();
        try {
            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
            if (response.statusCode() == 200) {
                String responseBody = response.body();
                Gson gson = new Gson();
                JsonObject json = gson.fromJson(responseBody, JsonObject.class);
                JsonArray exercises = json.getAsJsonArray("results");
                for (int i = 0; i < exercises.size(); i++) {
                    JsonObject exerciseJson = exercises.get(i).getAsJsonObject();
                    int exerciseId = exerciseJson.get("id").getAsInt();
                    int categoryId = exerciseJson.get("category").getAsJsonObject().get("id").getAsInt();
                    String categoryName = exerciseJson.get("category").getAsJsonObject().get("name").getAsString();

                    String exerciseName = "UNDEFINED";
                    String exerciseDescription = "UNDEFINED";
                    JsonArray exerciseLanguages = exerciseJson.getAsJsonArray("exercises");
                    for (JsonElement language : exerciseLanguages) {
                        int languageCode = language.getAsJsonObject().get("language").getAsInt();
                        if (languageCode == 2) {
                            exerciseName = language.getAsJsonObject().get("name").getAsString();
                            exerciseDescription = language.getAsJsonObject().get("description").getAsString();
                        }
                    }

                    JsonArray muscles = exerciseJson.getAsJsonArray("muscles");
                    ArrayList<Integer> muscleIds = new ArrayList<>();
                    for (JsonElement muscle: muscles){
                        int muscleId = muscle.getAsJsonObject().get("id").getAsInt();
                        muscleIds.add(muscleId);
                    }

                    JsonArray musclesSecondary = exerciseJson.getAsJsonArray("muscles_secondary");
                    ArrayList<Integer> muscleSecondaryIds = new ArrayList<>();
                    for (JsonElement muscleSecondary: musclesSecondary){
                        int muscleSecondaryId = muscleSecondary.getAsJsonObject().get("id").getAsInt();
                        muscleSecondaryIds.add(muscleSecondaryId);
                    }

                    JsonArray equipments = exerciseJson.getAsJsonArray("equipment");
                    ArrayList<Integer> equipmentIds = new ArrayList<>();
                    for (JsonElement equipment: equipments){
                        int equipmentId = equipment.getAsJsonObject().get("id").getAsInt();
                        equipmentIds.add(equipmentId);
                    }


                    System.out.println("ID:" + exerciseId + " Name: " + exerciseName + " Category: " + categoryId + " Description: " + exerciseDescription + "Muscles" + muscleIds +
                            "Secondary muscles " + muscleSecondaryIds + "Equipment:" + equipmentIds);
                    WgerExercise wgerExercise = new WgerExercise(exerciseId, exerciseName, new Category(categoryId, categoryName), exerciseDescription, muscleIds, muscleSecondaryIds, equipmentIds);
                    wgerExerciseList.add(wgerExercise);
                }
                return wgerExerciseList;
            }
        } catch (IOException | InterruptedException ignored) {
            //todo do some real handling, maybe logging and retrying
        }
        throw new RuntimeException("can't get data");
    }
}