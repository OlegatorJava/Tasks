package ru.circledevs.tasks.dto;

public class ResourceNotFoundExceptions extends RuntimeException{
    public ResourceNotFoundExceptions(String message) {
        super(message);
    }
}
