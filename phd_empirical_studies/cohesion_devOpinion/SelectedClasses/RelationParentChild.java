/*
 * FamilyTree - Family tree modeling software 
 * created for research purposes
 * Copyright - Helsinki Univerity of Technology, 
 * Software Business and Engineering Institute
 * Created on 23.7.2003
 */
package familytree.model;

public class RelationParentChild extends Relation {
    private Person child;
    private Person parent;
    
    public RelationParentChild (Person child, Person parent){
        this.child = child;
        this.parent = parent; 	
    }
       
    public boolean isParent(Person person){
        return person == parent;
    }
    
    public boolean isChild(Person person){
        return person == child;
    }
    
    public Person getChild() {
        return child;
    }
    
    public Person getParent() {
        return parent;
    }
    
    public Person getPerson1(){
        return getParent();
    }
    
    public Person getPerson2(){
        return getChild();
    }
    
    public boolean equals(Object obj){
        if (obj instanceof RelationParentChild) {
            RelationParentChild relation = (RelationParentChild) obj;
            return (this.getChild().equals(relation.getChild()) && 
                    this.getParent().equals(relation.getParent()));
        }
        return false;
    }
    
    public Person getPartner(Person person){
        if (person.equals(child))
            return parent;
        else if (person.equals(parent))
            return child;
        else
            return null;		
    }
    
    public String getRelationType(Person person) {
        if (person.equals(child)) {
            if (parent.isFemale())
                return MOTHER;
            else
                return FATHER;
        } else if (person.equals(parent)) {
            if (child.isFemale())
                return DAUGHTER;
            else
                return SON;
        } else
			return INVALID_RELATIONSHIP;
    }
    
}