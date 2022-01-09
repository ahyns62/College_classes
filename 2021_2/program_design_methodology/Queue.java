import java.util.Vector;

public class Queue{
	Vector q = new Vector(10);
	
	// 줄이 비어있는지
	public boolean isEmpty() {
		return q.isEmpty();
	}
	
	// 줄의 맨 앞에 있는 요소를 끄집어 낸다
	public Object dequeue() throws QueueEmptyException{
		if (isEmpty() == true)
			throw new QueueEmptyException();
		Object obj;
		obj = q.firstElement();
		q.removeElement(obj);
		return obj;
	}
	
	// 줄의 끝에 요소 추가
	public void enqueue(Object obj) {
		q.addElement(obj);
	}
	
}