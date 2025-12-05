package cs3220.ai_workout_generator;
import org.springframework.data.repository.CrudRepository;


public interface UserRepository extends CrudRepository<User, Integer> {
    User findByUsername(String username);
}
