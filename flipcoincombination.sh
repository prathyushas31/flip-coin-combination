read -p "Enter no of times to flip single coin:" n
#no of singlet combinatins = 2^1=2
#they are heads and tails
declare -A dictionary=( [heads]=0 [tails]=0 )
for(( flip = 1; flip <= n; flip++ ))
do
    echo -n "Flip-$flip is "
    (( toss = RANDOM % 2 ))
    if(( toss == 0 ))
    then
        echo "Heads"
        (( dictionary[heads]++  ))
    else
        echo "Tails"
        (( dictionary[tails]++  ))
    fi
done

for combination in ${!dictionary[@]}
do
    count=${dictionary[$combination]}
    percentage=$( echo "$count $n" | awk '{printf "%.2f", $1 * 100 / $2}')
    echo "percentage of $combination is $percentage"   
done 

