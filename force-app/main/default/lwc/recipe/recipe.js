import { LightningElement, api } from "lwc";
import getRecipeInformation from "@salesforce/apex/Spoonacular.getRecipeInformation";

export default class Recipe extends LightningElement {
    @api image;
    @api title;
    @api price;
    @api time;
    @api summary;
    @api recipeId;
    @api
    set dishTypes(data) {
      this.dishList = data && data.join();
    }
    get dishTypes() {
      return this.dishList;
    }
    @api
    set diets(data) {
      this.dietList = data && data.join();
    }
    get diets() {
      return this.dietList;
    }
    dishList;
    dietList;
  
    fetchRecipe() {
      getRecipeInformation({ recipeId: this.recipeId })
        .then((data) => {
          const recipe = JSON.parse(data);
          if (recipe) {
            this.image = recipe.image;
            this.price = recipe.pricePerServing;
            this.time = recipe.readyInMinutes;
            this.summary = recipe.summary;
            this.dishList = recipe.dishTypes && recipe.dishTypes.join();
            this.dietList = recipe.diets && recipe.diets.join();
          }
        })
        .catch((error) => {
          console.error(error);
        });
    }
  
    get hasDetails() {
      return this.summary ? true : false;
    }    
}