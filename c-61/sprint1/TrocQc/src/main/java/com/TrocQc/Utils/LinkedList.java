package com.TrocQc.Utils;

import java.util.Iterator;

public class LinkedList<T> implements Iterable<T> {

	private Node head;
	
	
	private class NodeIterator implements Iterator<T>{

		private Node current;
		
		
		
		public NodeIterator(LinkedList<T>.Node head) {
			this.current = head;
		}

		@Override
		public boolean hasNext() {
			return current != null;
		}

		@Override
		public T next() {
			if ( current != null && current.getNext() != null) {
				T element = current.getElement();
				current = current.getNext();
				return element;
			}
			return null;
		}
		
	}
	
	private class Node{
		private T element;
		private Node next;
		
		public Node(T element) {
			super();
			this.element = element;
			this.next = null;
		}
		
		
		public Node(T element, LinkedList<T>.Node next) {
			super();
			this.element = element;
			this.next = next;
		}


		public T getElement() {
			return element;
		}


		public void setElement(T element) {
			this.element = element;
		}


		public Node getNext() {
			return next;
		}


		public void setNext(Node next) {
			this.next = next;
		}
		
	}
	
	
	public LinkedList() {
		head = null;
	}
	
	public LinkedList(T first) {
		head = new Node(first);
	}
	
	public T get(int target) {
		return getAt(target);
	}
	
	public T getAt(int target) {
		Node current = getHead();
		int i = 0;
		
		
		while ( current != null && i < target && current.getNext() != null ) {
			current = current.getNext();
			i++;
		}
		
		if ( i == target && current != null) {
			return current.getElement();
		}
		return null;
	
	}
	public void setAt(int target, T element) {
	
		Node current = getHead();
		int i = 0;
		
		
		while ( current != null && i < target && current.getNext() != null ) {
			current = current.getNext();
			i++;
		}
		
		if ( i == target && current != null) {
			current.setElement(element);
		}
		else if ( target == 0) {
			add(element);
		}
	
	}
	
	
	public void insertAt(int target, T newelement) {
		Node current = getHead();
		int i = 0;
		if ( target == 0) {
			insertFirst(newelement);
			return;
		}
		
		
		while ( current != null && i < target && current.getNext() != null ) {
			current = current.getNext();
			i++;
		}
		
		if ( i == target && current != null) {
			Node newnode = new Node(newelement, current.getNext());
			current.setNext(newnode);
		}
		
	
	}
	public int size() {
		Node current = getHead();
		
		int i = 0;
		
		if ( current != null) {
			// count the head
			i++;
		}
		
		while ( current != null && current.getNext() != null ) {
			current = current.getNext();
			i++;
		}
		return i;
	}
	public void removeFirst() {
		Node current = getHead();
		if ( current != null) {
			head = current.getNext();
		}

	}
	public void removeLast() {
		removeAt(size()-1);
	}
	
	public void removeAt(int target) {
		Node current = getHead();
		
		int i = 0;
		if ( target == 0) {
			removeFirst();
			return;
		}
		Node previous = current;
		
		while ( current != null && i < target && current.getNext() != null ) {
			previous = current;
			current = current.getNext();
			i++;
		}
		
		if ( i == target && current != null) {
			previous.setNext(current.getNext());
		}
	}

	
	public T getFirst() {
		if ( getHead() != null) {
			return getHead().getElement();
		}
		return null;
	}
	public T getLast() {
		Node current = getHead();
		while ( current != null && current.getNext() != null ) {
			current = current.getNext();
		}
		if (current != null) {
			return current.getElement();
		}
		return null;
	}
	public void insertFirst(T newhead) {
		Node newnode = new Node(newhead, getHead());
		head = newnode;
	}
	private Node getHead() {
		return head;
	}
	private Node getTail() {
		Node current = head;
		while ( current != null && current.getNext() != null ) {
			current = current.getNext();
		}
		return current ;
	}
	
	public void add(T element) {
		insertLast(element);
	}
	
	public void insertLast(T newelement) {
		
		Node newnode = new Node(newelement);
		Node tail = getTail();
		if( tail != null) {
			tail.setNext(newnode);
		}
		else {
			head = newnode;
		}
		
	}
	
	public LinkedList<T> clone(){
		LinkedList<T> clone = new LinkedList<T>();

		Node current = head;
		while ( current != null  ) {
			clone.add(current.getElement());
			current = current.getNext();
		}
		return clone;
	}
	
	public int indexOf(T element) {
		
		int i = 0;
		Node current = head;
		while ( current != null  ) {
			if ( current.getElement() == element) {
				return i;
			}
			else {
				current = current.getNext();
				i++;
			}
		}
		return -1;
		
	}

	@Override
	public Iterator<T> iterator() {
		return new NodeIterator(head);
	}
	
	

}
