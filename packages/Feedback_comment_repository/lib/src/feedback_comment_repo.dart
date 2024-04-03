import 'models/models.dart';

abstract class FeedbackCommentRepository {
  Future<FeedbackComment> createFeedback();
  Future<List<FeedbackComment>> getFeedback();
}