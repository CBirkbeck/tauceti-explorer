# Mistakes in Couveignes, *Enumerating number fields*

Job ERRATA-PAPER-COUVEIGNES-20. Worker: Claude Code, session `cc-fb70e5`, 22 September 2026. The finding is in `PAPER-COUVEIGNES-20.json` beside this file.

**Paper and versions read.** Jean-Marc Couveignes, Annals of Mathematics 192 (2020), 487–497, DOI 10.4007/annals.2020.192.2.4. The extraction read the publisher PDF in full. The independent review REV-PAPER-COUVEIGNES-20 (PR #1655) also compared the arXiv source of 1907.13617v2 (29 August 2019). The published version states Theorem 1 and Propositions 1–2 with the root discriminant δ_K, where the arXiv text uses d_K^{1/n}; that is a revision, not a mistake.

**Earlier work.** The extraction PAPER-COUVEIGNES-20, by Codex, and its review found no mathematical mistake in the paper. The extraction noted the one notational slip recorded here (item `relation-lattice`).

**Existing corrections.** None was found:
- the Annals article page links no erratum;
- arXiv has v1 and v2, both with the same line;
- a web search found nothing.

## E1. A tensor product over Q of a Z-module (misprint; affects nothing)

In §3 the lattice of integer relations of degree at most d is introduced as "a free Z-module 𝓛 ⊂ V_R of rank ℓ". The next sentence sets "L = 𝓛 ⊗_Q R as the underlying R-vector space". Since 𝓛 is a Z-module, the tensor product should be over Z. The object used in the rest of the section is L = 𝓛 ⊗_Z R, the real span of 𝓛 inside V_R, which is the same as (𝓛 ⊗_Z Q) ⊗_Q R. The volume comparison of 𝓛 with its orthogonal lattice, and everything after it, is unaffected. The line was checked on the page image of p. 493 and is identical in the arXiv source.

## Checked and found correct

The following were checked because they are easy to get wrong, and they are correct as printed:
- the canonical measure of the sup-norm unit ball, 2^r(2π)^s > 2^n (p. 489);
- the lower bound 1 ≤ ‖x‖ for nonzero integral x;
- the monomial count C(d+r, d);
- the per-variable degree bound used for grid nonvanishing (p. 492).
