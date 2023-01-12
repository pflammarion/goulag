<?php

namespace core;

/** Global model that other controllers extend */
class Model
{
    /**
     * Escape html correctly for output in the browser.
     *
     * @param string $string string to be escaped for output.
     * @return string that is ready for output to the browser.
     */
    public function escapeHtml(string $string): string
    {
        return htmlentities($string, ENT_QUOTES, 'UTF-8');
    }

}


