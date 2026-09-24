# Handoff — BP-ArithmeticKTheory--N.7 (issue #678)

Agent: Claude Code, session `cc-7b31c4`. Branch `cc-7b31c4-bp-akt`. Stages in scope: **N.7** (regular primes
and Bernoulli numbers) and **N.8** (certified examples).

## Deliverables

- `research/blueprint/packets/ArithmeticKTheory--N.7.json` — 15 nodes (3 definitions, 1 construction,
  4 theorems, 2 comparisons, 5 applications), 23 API items, 16 unit tests, 6 planets, 21 pinned baseline
  declarations, 4 gaps, 8 requests, 2 structural proposals. `"part": "N.7"`, `"status": "partial"`.
  **Both layers in scope are `source_decomposed`.**
- `research/blueprint/readmes/ArithmeticKTheory--N.7.md` — the roadmap document, 641 lines.
- `research/blueprint/suggested/ArithmeticKTheory--N.7.lean` — signatures and prototypes, **not compiled**.
- This note.

## Checks

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticKTheory--N.7.json --index $TAUCETI_BASELINE/declarations.tsv`
  → **0 errors, 0 warnings**, with the pinned index in place, so all 21 baseline references were resolved
  against it and not merely checked for form.
- `python3 -m unittest discover -s tests` → 273 tests, OK.
- `python3 research/blueprint/intake.py check-files` on the four changed paths → 0 problems.
- **No Lean was run.** The Mathlib build here is a shared cache that must not be rebuilt and this tree has no
  elaborated dependency modules. Nothing is claimed to be formalised; every `implementationStatus` is
  `unchecked`.

## One source, already in the programme

Weibel's *K-book*, author-hosted draft of 29 August 2013, SHA-256 `a04f53c9…b058845` — **the same file**
`K2SymbolsBrauer--T.3.json`, `Polylogarithms.json` and `MotivesAndAlgebraicCycles.json` already cite; the hash
reproduces. Read for this job: III.5.2.2 and III.6.1–III.6.5.3; VI.2.4–VI.2.4.1; VI.5.3; VI.8.1–VI.8.6;
VI.10.1.1–VI.10.8.2.

## What AUDIT-27 changed

Read first, as always. Two things it says shaped the packet.

1. **The libraries have the raw material and not the word.** Both Bernoulli conventions are pinned with the
   lemma relating them; cyclotomic extensions, class numbers, the class group, ramification and inertia, unit
   rank, places and the Dedekind zeta function are all there; and Mathlib proves that `p` has a **unique** prime
   above it in `ℚ(ζ_p)` with `e = p−1`, `f = 1`. But a grep for *regular prime* over both trees returns nothing,
   and so does one for *Vandiver*. So the definition of a regular prime is a composition of pinned objects, and
   a structural proposal records it as an early library target.
2. **N.8's computations all belong to other layers.** AUDIT-27 records three duplications —
   `SpecialValuesBirchTate:B.3`, `K2SymbolsBrauer:T.5` and `K3BlochGroups:V.5` — and each names a genuine owner.
   Every computation N.8's text asks for is imported with its owner named, and what N.8 owns is the **format**
   of a certified example, the **labelling rule** and the **consistency checks**. The second structural proposal
   asks that its stage text say so, because as written it reads as a computation task and invites a worker to
   re-plan three other layers.

## What the layers own

**N.7.** The arithmetic Bernoulli convention with the conversion; the invariant `w_i` with `w_i(ℚ) = 2` for odd
`i` and the denominator of `B_k/4k` for `i = 2k`; regular and irregular primes with Iwasawa's form and the data;
Kummer's criterion turning the class-number condition into a finite check; the eigenspace decomposition with
the denominator restriction the stage text demands — the projectors need `(l−1)⁻¹` and do **not** exist
integrally — and Herbrand–Ribet; the vanishing of the `l`-primary tame kernel of `ℚ(ζ_l)` at an odd regular
prime, from the three inputs the stage text names (Tate's comparison, the class-group input, the local Brauer
sequence); the torsion consequences with their explicit degrees and generator counts, including the worked case
`l = 5`; and Vandiver kept strictly apart, with the **unconditional** statement about `K_{4i}(ℤ)` recorded
beside the conditional table.

**The S-integer question** the stage text asks to be explained is answered by arithmetic, not K-theory: the
unique prime above `l` in `ℚ(ζ_l)` has inertia degree one, so its residue field is `𝔽_l` and its unit group has
order `l−1`, prime to `l`. A proof that invoked a K-theoretic vanishing instead would be circular, and the node
says so.

**N.8.** The certificate format with the labelling rule (an order deduced from Birch–Tate is a **corollary** and
may not then be the independent test of it); `K₀`–`K₄` of `ℤ` with owners and two consistency checks; the
Gaussian case, where the tame kernel vanishes (Tate) and `K₃(ℚ(i)) ≅ ℤ ⊕ ℤ/24` follows from the structure
theorem with `w₂ = 24`, the contrast with `ℚ` being exactly the real place; the S-integer sequence
`0 → K₂(ℤ) → K₂(ℤ[1/p]) → 𝔽_p^× → 0`, obtained by **comparing two instances** of the tame-kernel sequence
rather than by a new localisation theorem, with the extension class explicitly not determined; the check that
`K₂(ℚ)` is infinite while the tame kernel has order two; the real quadratic example; and the status of
Birch–Tate, odd part Wiles for totally real abelian fields, two-primary part open in general but known for
abelian extensions of `ℚ`.

## Gaps, each with its next source action

1. **Washington's book was not obtained** — it is where the K-book sends the reader for Kummer's criterion and
   the congruences. Both are quoted, neither is proved.
2. **Herbrand–Ribet is quoted from a remark** — the original papers were not obtained; Ribet's half uses
   modular forms and is substantial work in its own right.
3. **The tame-kernel presentations of quadratic fields** are in Browkin–Schinzel (Crelle 1982), not obtained;
   the arithmetic half of the certificate is available from the libraries, the presentation half is not.
4. **The vanishing of `K₂(ℤ[i])` is cited to Tate**, not proved; the method is Milnor's Euclidean algorithm and
   it is a good candidate for an early formalisation.

## Where to resume

The cheapest real progress is the pair (definition of a regular prime, decidability instance) against the
pinned class number — it unblocks the statement of N.7's main theorem and every certified example of N.8.
After that, obtaining Washington and decomposing Kummer's criterion is the step that turns N.7 from a layer of
correct statements into a layer with proofs.
