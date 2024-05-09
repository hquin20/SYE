## Paper Notes

For double spacing, you can use that code that I sent last week. That code allows the text to be double-spaced but the code to still be single-spaced.

## Abstract and Introduction

This all sounds great: it's concise and well-written.

## Data

Also sounds great. A few things to consider adding:

* after "number of requirements of the Bechdel test that it passes," might add "Only movies with a `3` for this variable fully pass the Bechdel test."

* plot at the top of page 9: consider adding `+ geom_smooth()`

* [enter some visual about genres here?]. Up to you! If you do, I think you could do a stacked bar plot with `fill = pass_or_not` and `x = genre`. (reading further along, pretty much the same plot you did for content rating but `genre` swapped out for rating).

* page 14: change "logit represents...." to $logit(\pi)$ represents....

* page 14: change "Interaction terms representing the changes in probability over time are included in the model for every genre as well" to something like "Interaction terms allow for the association between the log odds of passing the test and time to be different for different genres."

* page 16: change "decrease by 22.12 as compared to other genres" to "decrease by 22.12 compared to movies that are not classified into the Adventure genre." But might actually cut this entirely: the interpretation only holds when year is equal to `0`, which isn't really realistic for this data set. More generally, we will talk about "However, as revealed by the interaction between adventure and release year, the opposite effect is observed. When accounting for release year, the log odds of passing the test increase by 0.011 when the movie is considered an adventure film. Both relationships are proven to be statistically significant. These opposing effects may result from a majority of older adventure movies not passing the test combined with a smaller number of newer movies mostly passing the test" at our meeting.

* plot at top of page 18: geom_rug() needs alpha (both rugs should use the same alpha). Same with plot on page 19.

* page 21: value for budget coefficient in text does not match value for budget coefficient in table. Same with imbd_rating coefficient and metascore coefficient and year.

* delete "This relationship is only approaching significance, but it was determined that year plays a crucial role when it comes the role women play in film, so it was kept in the model." 

Nice work! Most of the suggested changes are minor. I think the only thing we need to explicitly discuss at our meeting is the interpretations on page 16. 
