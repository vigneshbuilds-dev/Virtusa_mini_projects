import java.util.Scanner;

public class PasswordValidator {

    static final int MIN_LENGTH = 8;

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.println("==================================");
        System.out.println("      SafeLog Password Check      ");
        System.out.println("==================================");

        boolean validPassword = false;

        while (!validPassword) {

            System.out.print("\nCreate your password: ");
            String password = sc.nextLine();

            validPassword = checkPassword(password);

            if (validPassword) {
                System.out.println("Password created successfully.");
            } else {
                System.out.println("Please try again.");
            }
        }

        sc.close();
    }

    public static boolean checkPassword(String password) {

        boolean hasUpperCase = false;
        boolean hasDigit = false;

        if (password.length() < MIN_LENGTH) {
            System.out.println("Password is too short. Minimum 8 characters required.");
            return false;
        }

        for (int i = 0; i < password.length(); i++) {

            char ch = password.charAt(i);

            if (Character.isUpperCase(ch)) {
                hasUpperCase = true;
            }

            if (Character.isDigit(ch)) {
                hasDigit = true;
            }
        }

        if (!hasUpperCase) {
            System.out.println("Password must contain at least one uppercase letter.");
        }

        if (!hasDigit) {
            System.out.println("Password must contain at least one digit.");
        }

        return hasUpperCase && hasDigit;
    }
}
