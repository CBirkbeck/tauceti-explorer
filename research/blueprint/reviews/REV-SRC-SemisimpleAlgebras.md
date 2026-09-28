Verdict: accepted

# Review of SRC-SemisimpleAlgebras

Reviewer: Claude Code — cc-fb70e5. This agent did not do the source job, which was by cc-39fac3 in #3316.

- **Result reviewed:** `research/blueprint/sources/SRC-SemisimpleAlgebras.result.json`, as it is on `main`.
- **Batch:** `research/blueprint/sources/jobs/SRC-SemisimpleAlgebras.json`. It has one restricted book, LAM-FIRST-COURSE-NONCOMMUTATIVE-RINGS, with one citation.

## The one citation: README.md line 375 — accepted

Line 375 of `content/tau-ceti/RepresentationTheory/SemisimpleAlgebras/README.md` is the first reference-list entry. Continued on line 376, it cites Lam's *A First Course in Noncommutative Rings* for five topics: semisimple rings, the Jacobson radical, the density theorem, Wedderburn–Artin, and an introduction to Brauer groups. It is a background reference. The layers carry their own pins to Mathlib.

The worker replaces it with P. L. Clark, *Noncommutative algebra* (lecture notes, §§2–4), and cites the density theorem to Mathlib's `jacobson_density`.

### What I opened

**Clark's notes.**
- The author's host `alpha.math.uga.edu` did not answer from here either, so I downloaded the Internet Archive's capture of the exact URL myself, `https://web.archive.org/web/20241118181457id_/http://alpha.math.uga.edu/~pete/noncommutativealgebra.pdf`.
- It is 677325 bytes and 81 pages, with SHA-256 `6f3f590c703d46f6acd84e94880de20330f5ec229ee0663d0f896a9b6920f906`, identical to the worker's record. It is marked "© Pete L. Clark, 2012", and its printed page numbers equal the PDF page numbers.
- I read §2 (pp. 18–26), §3.1–3.3 (pp. 30–35) and §4.1–4.3 (pp. 41–45) in the extracted text, and checked every numbered result the locator names.

**Mathlib at 082e2d3.**
- `Mathlib/RingTheory/SimpleModule/Basic.lean`, lines 552–584, the `jacobson_density` section.
- `Mathlib/RingTheory/Artinian/Module.lean`, line 650.
- `Mathlib/RingTheory/SimpleModule/WedderburnArtin.lean`, lines 113–201.

**The author's index page.** A capture of Clark's page `alpha.math.uga.edu/~pete/expositions2012.html` ("Pete L. Clark's Expositions", Internet Archive 20241209144237). It lists "Non-Commutative Algebra: Notes from a 2011 summer lecture series given at UGA (pdf) (81 pages)", linking this file.

### Topic by topic

**Semisimple rings: holds.**
- §2.1, p. 19: Proposition 2.4 says that for a semisimple module, finitely generated ⇔ Noetherian ⇔ Artinian ⇔ a finite direct sum of simples.
- Theorem 2.5, pp. 19–20: the six characterisations of a semisimple ring.
- Corollary 2.6, p. 20: a left semisimple ring is left Noetherian and left Artinian.
- All three have proofs, over an arbitrary ring, as in Lam.

**Wedderburn–Artin: holds.** All three parts have proofs:
- **Theorem 2.8, p. 21 (Part I):** M_n(D) is simple, left Artinian and left Noetherian, with a unique simple module V and R ≅ Vⁿ.
- **Theorem 2.16, pp. 24–25 (Part II):** a left semisimple ring is ∏ M_{n_i}(D_i) with D_i = End(V_i), and r, the multiset {n_i} and the D_i are invariants.
- **Theorem 2.19, p. 26 (Part III):** for a simple ring, left Artinian ⇔ has a minimal left ideal ⇔ left semisimple ⇔ ≅ M_n(D).

The invariance in Theorem 2.16(c) is exactly the uniqueness this roadmap says Mathlib lacks.

**The Jacobson radical: holds, with one correction to the worker's evidence.** These results have proofs:
- Proposition 3.6, p. 31: rad_l R is the common annihilator of the simple modules, and a two-sided ideal.
- Theorem 3.9, p. 33: Nakayama's lemma for rings.
- Corollary 3.11, p. 33: rad_l R = rad_r R.
- Theorem 3.15, p. 34: the radical of a left Artinian ring is nilpotent, and for a left ideal, nilpotent ⇔ nil ⇔ contained in rad R.

The correction: the evidence lists Corollary 3.12 (the four characterisations) and Corollary 3.13 (an Artinian ring is semisimple iff rad R = 0) among results "read there with proofs". They are not proved in the notes: they are Exercises 3.4 and 3.5 on pp. 33–34. This does not sink the citation:
- The entry is a general textbook reference for the topic, and the notes develop the radical with proofs.
- Parts (i) and (ii) of Corollary 3.12 are the definition together with the proved Corollary 3.11.
- The criterion in Corollary 3.13 is pinned by the roadmap itself to Mathlib's `IsArtinianRing.isSemisimpleRing_iff_jacobson` (README lines 15, 101 and 177; the declaration is at `RingTheory/Artinian/Module.lean:650`).
- The left–right symmetry that Mathlib lists as a TODO, which the roadmap folds into Layer 0, is Corollary 3.11, and that one is proved.

**The density theorem: holds, through Mathlib.**
- The notes do not contain it: "density" occurs only once in the text, as Čebotarev density on p. 79.
- At the pin, `jacobson_density` (line 560) states: for `[IsSemisimpleModule R M]`, `f : End (End R M) M` and `s : Finset M`, there is an `r : R` with `f m = r • m` for all `m ∈ s`.
- That is the Jacobson–Chevalley density theorem for a semisimple module, with its hypothesis and in full generality. `Module.Finite.toModuleEnd_moduleEnd_surjective` (line 572) is the corollary for a module finite over its endomorphism ring.
- The roadmap's own Mathlib section (lines 16 and 104) already names both.

Citing the declaration is better than a reference, as the job's rules say.

**Introduction to Brauer groups: holds.**
- §4.2, pp. 43–44: the Brauer group is constructed from Brauer equivalence (Lemma 4.6). The product is shown to be well defined, the identity is identified, and [A]·[A^op] = 1 follows from A ⊗ A^op ≅ End_k(A) (Theorem 4.4).
- It is summed up in Theorem 4.8, p. 44: Br(k) is a commutative group, in bijection with the finite-dimensional central division algebras.
- The small lemmas 4.5–4.7 are left as exercises. The group structure itself is argued in the text.
- Skolem–Noether (Theorem 4.10, §4.3, p. 45) and the double centralizer theorem (§4.4) follow.

This matches "an introduction to Brauer groups".

### Is the replacement line the same mathematics, and does `old` still match?

- On `main`, line 375 is exactly the edit's `old`.
- The `new` line changes only the reference: "P. L. Clark, *Noncommutative algebra*, lecture notes, University of Georgia (2012), §§2–4, with Mathlib's `jacobson_density` for the density theorem - semisimple rings,".
- Line 376, "the Jacobson radical, the density theorem, Wedderburn-Artin, and an introduction to Brauer groups.", is untouched, and every topic in it is covered as shown above.
- No statement, stage, layer or scope changes.
- The date: the notes are from a 2011 lecture series, and the file is marked © 2012. "(2012)" follows the file, and either year is accurate.

### Is the source legitimately free?

Yes. The file is the author's own copy, in his directory at the University of Georgia, and linked from his own "Expositions" page. It is not a scan site or a course page reposting someone else's book. The live host is down, but the archived copy is of that exact URL and matches byte for byte.

### The register addition

- CLARK-NONCOMMUTATIVE-ALGEBRA is `access: free` and has `kind: notes`.
- Its patterns `Clark, \*Noncommutative algebra\*` and the URL match the new line.
- Farb–Dennis's pattern `\*Noncommutative\ Algebra\*` does not match it, being case-sensitive. The sentence-case title in the new line is what keeps the two apart, as the worker noted.
- I applied the edit and the register entry in memory to `main`'s content:
  - the only document citing CLARK-NONCOMMUTATIVE-ALGEBRA is this README;
  - no document cites LAM-FIRST-COURSE-NONCOMMUTATIVE-RINGS any more.

### "Kept" citations

There are none. The batch has one citation, and it was replaced.

## Checks

`scripts/sources.py --check` fails only on links to blocked hosts and on publisher links the register does not know. I ran its `unlawful` and `unregistered` functions, taken from `main`, over `main`'s `content/` and `research/` in memory (the shared checkout is on another session's branch). I ran them twice:
- on `main` as it is: 0 and 0, pass;
- with the edit and the register addition applied: 0 and 0, pass.

The new line adds no URL, and the register's URL is the author's host.

I did not run the repository's unit tests; the shared checkout is on another session's branch, and the job changes no code.

## Summary

The replacement holds, with one correction for the record: Clark's Corollaries 3.12 and 3.13 are exercises, not proved results. That does not affect the citation, because the notes develop the Jacobson radical with proofs, and the roadmap pins the Artinian semisimplicity criterion to Mathlib.
