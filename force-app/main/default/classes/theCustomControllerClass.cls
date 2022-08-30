public class theCustomControllerClass {
    public String searchText {set;get;}
    public List<Lead> results {set;get;}
    
    public String getSearchText(){
        return searchText;
    }
    public void setSearchText(String text){
        this.searchText = text;
    }
    public List<Lead> getResults(){
        return results;
    }
    public PageReference doSearch(){
        results = (List<Lead>)[FIND :searchText Returning Lead(Name,Email,Phone)][0];
        return null;
    }
}