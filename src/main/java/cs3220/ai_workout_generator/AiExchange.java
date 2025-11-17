package cs3220.ai_workout_generator;

public class AiExchange {
    private String userMessage;
    private String aiMessage;

    public AiExchange(String userMessage, String aiResponse) {
        this.userMessage = userMessage;
        this.aiMessage = aiResponse;
    }

    public String getUserMessage() {
        return userMessage;
    }

    public void setUserMessage(String userMessage) {
        this.userMessage = userMessage;
    }

    public String getAiMessage() {
        return aiMessage;
    }

    public void setAiMessage(String aiMessage) {
        this.aiMessage = aiMessage;
    }
}
