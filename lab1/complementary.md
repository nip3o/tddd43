## TDDD43, Lab part 1

### Question 5
> How both models can be combined in this application? How the combined model can be stored? Which parts of the application would you create as relations, XML? Justify. How the data consistency will be preserved? How the 'semi-structured textual description about the expert would be represented?

It easy to describe one-to-many relations in an XML hierarchy, for example to describe all subcategories for a category (if each subcategory only can have one parent). The relationship between parents and children is given by the structure without need for parent-pointers or similar as in a relational database.

It would be nice to describe such relations in XML, but to be able to preserve data consistency this would require a DBMS with support for XML types that allows you to add data constraints to XML data. Even though DBMS services such as PostgreSQL provides support for XML types, I am not aware of any such service that actually allows adding constraints to the data.

In practice the only option would be to only store XML data without any relations to the relational database. The semi-structured textual description about an expert is a typical example of such non-related data which should be stored in an XML field. Another use for using XML in a relational database system could be if we wanted to add database fields dynamically, without updating the database structure.



## TDDD43, Lab part 2

### Question 1a

    SELECT expert.name FROM expertise, expert 
    WHERE expert.id = expertise.expert 
    AND expertise.expertArea = 3
    
Result

    Niclas Olofsson
    
    
### Question 2e