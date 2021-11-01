import org.flywaydb.core.Flyway;
import org.jetbrains.annotations.NotNull;

public class Main {
    public static final @NotNull String CONNECTION="jdbc:postgresql://localhost:5432/";
    public static final @NotNull String DB_NAME="flywaydb";
    public static final @NotNull String USERNAME="postgres";
    public static final @NotNull String PASSWORD="0000";


    public static void main(@NotNull String [] args) {
        final Flyway flywa = Flyway
                .configure()
                .dataSource(CONNECTION + DB_NAME, USERNAME, PASSWORD)
                .locations("db")
                .load();
        flywa.clean();
        flywa.migrate();
        System.out.println("Migrations applied successfully");

    }
}
