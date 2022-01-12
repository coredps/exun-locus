Web Development Task 1
======================

**Calculate the total points of the users who are part of the team “Ace”.**

.. code:: sh

    $ awk -F, '$9 == "Ace"{points+=$7}END{print points}' hunt-data.csv
    
    175903

**There are two entries given in the data which have the same email address. Find them.**

.. code:: sh

    $ awk -F, '$3 in a{print b[$3] "," $1 "-" $3} {a[$3]=$0} {b[$3]=$1}' hunt-data.csv
    
    17,72-nicoleking@example.org
    147,515-ojohnson@example.com
    6,2992-gcox@example.com
    560,3224-hsmith@example.org
    3103,3491-william35@example.com
    34,3523-johnsonjason@example.org
    407,3619-colejoshua@example.com
    1436,3625-ljohnson@example.com
    47,3660-ewilson@example.com

**Find the number of admin users.**

.. code:: sh

    $ grep -c "\(.*,\)\{3\}1,\(.*,\)\{6\}" hunt-data.csv

    10

**Find the number of disqualified users.**

.. code:: sh

    $ grep -c "\(.*,\)\{4\}1,\(.*,\)\{5\}" hunt-data.csv

    35