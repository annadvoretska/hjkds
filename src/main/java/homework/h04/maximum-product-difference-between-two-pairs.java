class Solution {
    public int maxProductDifference(int[] nums) {
        int max1 = 0;
        int max2 = 0;
        int min1 = Integer.MAX_VALUE;
        int min2 = Integer.MAX_VALUE;

        for (int x : nums) {
            if (x > Math.min(max2, max1)){
                max2 = Math.max(max2, max1);
                max1 = x;
            }
            if (x < Math.max(min2, min1)){
                min2 = Math.min(min2, min1);
                min1 = x;
            }  
        }
        return max1 * max2 - min1 * min2;
    }
}
