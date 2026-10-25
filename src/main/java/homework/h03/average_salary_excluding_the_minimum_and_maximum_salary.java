class Solution {
    public double average(int[] salary) {
        int sum = 0;

        Arrays.sort(salary);
        salary[0] = 0;
    
        for (int i = 1; i < salary.length - 1; i++) {
            sum += salary[i];

        }

        return (double) sum / (salary.length - 2);
    }
}
//If it works, don't touch it.
