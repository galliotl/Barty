/**
 * Cette fonction permet de vérifier si une catégorie exitse bien
 * (si la string qui la représente fait bien partie du tableau arrayOfBeveragesCategories ci-dessous)
 * Retourne un boolean
 * @param category
 */
export const verifyBeverageCategory = (category: string): Boolean => {
    let arrayOfBeveragesCategories: string[] = ['beer', 'cocktail', 'soft', 'wine', 'hard']; 
    /*arrayOfBeveragesCategories.push('beer');
    arrayOfBeveragesCategories.push('cocktail');
    arrayOfBeveragesCategories.push('soft');
    arrayOfBeveragesCategories.push('wine');
    arrayOfBeveragesCategories.push('hard');*/
    if (arrayOfBeveragesCategories.some(x=> x == category)) {
      return true;
    }
    return false;
  };