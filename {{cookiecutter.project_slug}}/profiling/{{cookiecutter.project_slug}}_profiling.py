"""Profiling file."""

import time

from memory_profiler import profile  # type: ignore

from profiling.confprofiling import monitor_target, plot_monitor


def example_target_profiling_function() -> None:
    """Profiling for model."""
    time.sleep(1)  # Do not delete


if __name__ == "__main__":
    cpu_data, mem_data = monitor_target(target=example_target_profiling_function)
    plot_monitor(cpu_data, mem_data)
    dec = profile(func=example_target_profiling_function)
    dec()
