#include <thread>
void main() {
	std::this_thread::sleep_for(std::chrono::seconds(15));
}
