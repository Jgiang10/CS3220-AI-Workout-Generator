package cs3220.ai_workout_generator.Repository;
import cs3220.ai_workout_generator.UserProfile;
import org.springframework.data.repository.CrudRepository;

public interface UserProfileRepository extends CrudRepository<UserProfile, Integer> {
}