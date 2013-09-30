# TDDD43, Lab 1

## Part 1


### Question 2
> How can the problem be modelled in XML? How the different parts of the application can be
represented as XML? What alternatives are there (in principle), and what pros and cons do you see with the alternatives?

One alternative is to use the same approach as an relational database. We make separate elements for each type of object, such as Expert, Recommendation and ExpertArea, and then use ID attributes to describe the relations between objects. A benefit of this approach is the flexibility. For example: the same Expert can be the author of multiple Recommendations, without duplicating any data. This approach would however make it hard to select information with XPath-queries, since the docuemtn structure does not describe the elements very well.

Another alternative is to describe relations based on the hierarchy of elements. A Recommendation-element may contain a Author-element, which in turn contains the information about an Expert. Quite much data will be duplicated and it is not very flexible, but it describes the relations very well and makes it easy to, for instance, get the names of all recommended Experts with XPath.

The best way is probably to use a combination of the two above. 


### Question 4
> Which parts of the above application were most suitable to represent as relations, or XML. Why?

* ExpertAreas is suitable to represent as XML, since the fact that ExpertAreas can have sub-areas fits very well into a structure where an element can have an infinite number of children.

* Expertises are probably best modeled using a combination of XML and relation approach, since one can specify all ExpertAreas as child elements for each Expert, but referring to the ExpertAreas as relations to avoid duplicating data.

* Recommendations is more suitable to model using relations, since it refers to Experts that is used in other relations. If one were to model this with a XML structure, we would have to duplicate all data about each recommended expert for each Recommendation, which is typically a very bad thing.


### Question 5
> How both models can be combined in this application? How the combined model can be stored? Which parts of the application would you create as rezlations, XML? Justify.

This is partially answered by Question 4 above. A combination of the XML and relation approaches is useful when we have a one-to-many-relation, since we can list the relation for each "many"-object, and refer to the "one"-object by a relation since it per definition is used by multiple related objects. 

One way to store this is by storing XML as text fields in a relational database.

## Part 2

### Task 1 - SQL

#### 1a)

    SELECT expert.name FROM expertArea, expert
    WHERE expertArea.id = expert.id AND expertArea.id = 2

Result 

    Holger Grenquist

#### 1b)

    SELECT child.description FROM ExpertArea AS child, ExpertArea AS parent
    WHERE child.parent = parent.id AND parent.id = 1

Result

    Databases
    Programming

#### 1c)

    SELECT expert.name FROM recommendation, expert, expertise
    WHERE expert.id = recommendation.recommendedExpert
    AND expert.id = expertise.expert
    AND expertise.expertArea = 3
    AND recommendation.authorExpert = 2
    
Result

    Niclas Olofsson

#### 1d)

    SELECT expert.name FROM recommendation AS r1, recommendation AS r2, expert, expertise
    WHERE expert.id = expertise.expert
    AND expert.id = r2.recommendedExpert
    AND r1.recommendedExpert = r2.authorExpert
    AND expertise.expertArea = 3
    AND r1.authorExpert = 3
    
Result

	Niclas Olofsson

#### 1e)
Not possible (at least not without recursive non-standard stuff)


### Task 2 - XQuery

#### Task 2a)

    /lab1/experts/expert[expertises/expertise/expertAreaId=2]
    
Result
    
    <expert id="2">
            <name>Holger Grenquist</name>
            <email>holger@grenquist.se</email>
            <expertises>
                <expertise>
                    <expertAreaId>2</expertAreaId>
                </expertise>
            </expertises>
     </expert>
        

#### Task 2b)

    /lab1/expertAreas/expertArea[@id=1]/subAreas/expertArea
    
    <expertArea id="2">
        <description>Databases</description>
        (...)
    </expertArea>

Result
        
    <expertArea id="4">
        <description>Programming</description>
    </expertArea>
    
    
#### Task 2c)

    /lab1/experts/expert[
     expertises/expertise/expertAreaId=3 and
     /lab1/recommendations/recommendation/authorExpertId=2 and
     /lab1/recommendations/recommendation/recommendedExpertId=@id]

Result

    <expert id="1">
        <name>Niclas Olofsson</name>
        (...)
    </expert>
     

#### Task 2d)
	for $expert in /lab1/experts/expert
		where $expert/expertises/expertise/expertAreaId=3
		where /lab1/recommendations/recommendation/authorExpertId=2
		where /lab1/recommendations/recommendation/recommendedExpertId=$expert/@id
	return $expert
	
Result
	
	<expert id="1">
    	<name>Niclas Olofsson</name>
        (...)
     </expert>


#### Task 2e)

I really cannot come up with a working solution on this one, allthough it feels like it should be possible since it is easy to recursively find all children of a parent element. It might require the data to be structured in some other way, for example by storing all recommendations as a child to the Expert that is subject to (or author of) the recommendation.

### Task 3

> Are there any of the above queries that could not be expressed in the above languages? 

It seems like the query in task e) is hard to express in both languages.

### Task 4

> Which of the query languages do you find most easy to use? Why? Any particular query or kind of data that is easier to express in any of the above languages? 

I think SQL is more easy to use overall, but the reason for that is probably just since I am used to it. XQuery is easier to use when dealing with one-to-one relationships. We do not have to think abount joins since the relationship is given by the document structure. This is especially practical in multiple levels such as for the ExpertAreas, where it would be impossible to recursively find all sub-areas (both direct and indirect) for an ExpertArea in SQL, but quite easy with a XPath query.
