public class Spoonacular {
    private static final String SPOONACULAR_API = 'https://api.spoonacular.com';
    private static final String API_KEY = '5ebd11f56252452faea73beb9c68fa0b';
    
	@AuraEnabled
    public static String getRandomRecipe(){
        Http http = new Http();
		HttpRequest request = new HttpRequest();
		request.setEndpoint(SPOONACULAR_API+'/recipes/random?apiKey='+API_KEY);
		request.setMethod('GET');

        HttpResponse response = http.send(request);
		System.debug('response code'+response.getStatusCode());
		if(response.getStatusCode() == 200) {   
		    return response.getBody();
		}
        return '';
    }
    
	@AuraEnabled
    public static String getRecipeInformation(String recipeId){
        Http http = new Http();
		HttpRequest request = new HttpRequest();
		request.setEndpoint(SPOONACULAR_API+'/recipes/'+recipeId+'/information?apiKey='+API_KEY);
		request.setMethod('GET');

        HttpResponse response = http.send(request);
		System.debug('response code'+response.getStatusCode());
		if(response.getStatusCode() == 200) {   
		    return response.getBody();
		}
        return '';
    }

    @AuraEnabled     
    public static String getRecipeByIngredients(String ingredients){
        Http http = new Http();
		HttpRequest request = new HttpRequest();
		request.setEndpoint(SPOONACULAR_API+'/recipes/findByIngredients?apiKey='+API_KEY+'&ingredients='+ingredients);
		request.setMethod('GET');

        HttpResponse response = http.send(request);
		System.debug('response code'+response.getStatusCode());
		if(response.getStatusCode() == 200) {   
		    return response.getBody();
		}
        return '';
    }
}