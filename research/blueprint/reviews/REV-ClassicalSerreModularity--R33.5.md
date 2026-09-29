# REV-ClassicalSerreModularity--R33.5 — independent review

Reviewer: Claude Code, session cc-fb70e5 (issue #371, claimed by comment). The work under review is checkpoint 1 of
BP-ClassicalSerreModularity--R33.5, covering stages R33.5–R33.6 (PR #3860). Another session, Claude Code cc-39fac3, wrote it.
Date: 2026-09-29.

**Verdict: accepted after corrections.** All 8 nodes were checked (R33.5: 4, R33.6: 4):

- 2 were corrected;
- 6 were verified;
- none was added.

No new source issues were found. Two nodes now cite source issue E9 of part R27.3.

## What was checked

- **Sources.** Both PDFs were downloaded, and their sha256 hashes reproduce the packet's:
  - the KW I preprint `results.pdf` (3c389dc3…);
  - Dieulefait–Pacetti, arXiv:2108.07577v2 (0c6850da…).

  All 15 excerpts were compared with the extracted text. 14 match verbatim after normalisation. The other one differs only by a
  hyphen at a line break. Every excerpt is on the page its locator gives.
- **Closure and baseline.**
  - `check_blueprint --index` gives 0 errors and 0 warnings. The packet cites no baseline declarations.
  - Each of the 6 requests was compared with its supplier layer's description in the atlas.
    - R24.3 and R24.6 cover the dyadic lift and the compatible system.
    - R32.6 explicitly owns the globalisation audit.
    - R15.6 covers the definitions.
    - R17.6 covers Rohrlich–Tunnell.
    - R20.6 covers the dyadic weight-4 optimisation.
- **Independence claims.** These are the substance of this part, so they were checked by computation. The prerequisite closures were
  computed over the integrated decomposition and the three part packets (R26.1, R27.3 and R33.5).
  - The closure of `R33.5/qualitative-serre-theorem` (42 ids) contains exactly four ClassicalSerreModularity nodes, all from R27.1:
    - Definition 2.1;
    - Lemma 6.3;
    - the Dickson package;
    - Lemma 8.2.

    It contains no node of R26 or R27.2–R27.6.
  - The closure of `R33.6/strong-form-by-the-modern-route` adds only `R27.4/strong-form-by-minimal-lifts`.
  - The closure of `R27.6/full-classical-serre-theorem` contains the whole KW induction (R26.x, R27.2–R27.5).

  This confirms `R33.5/globalisation-dependency-check` and the closure part of `R33.6/two-routes-comparison`.
- **Statements and proofs.** All 8 were read against DP §§1–3 and KW I, including:
  - DP Theorems 1.4–1.7, 1.9 and 1.11, Definition 1.10 and Remark 4 (pp. 4–7), and §3 (p. 15);
  - KW I Theorem 4.1 (p. 7), Theorem 5.1 (pp. 9–10), Lemmas 6.1–6.2 (pp. 10–11), and the introduction (p. 2).
- **Suggested Lean file.** It imports Mathlib only. `lake env lean` against Mathlib 082e2d37e (the pinned 082e2d3) compiles it with no
  errors. Its arithmetic is correct: the upper-triangular group of PGL₂(𝔽₄) has order 36/3 = 12, and |PGL₂(𝔽₄)| = 4·15 = 60.
- **Planets.** There are 3, all on theorem nodes. No node is a construction, so no API or unit tests are required.

## Corrections

1. **`R33.5/auxiliary-odd-prime-for-the-dyadic-system`.**
   - The fourth hypothesis said that the oddness of the system "comes from the parity conditions in KW I Theorem 5.1 at p = 2".
     No such condition applies here. KW I Theorem 5.1 states in its conclusion that the system is "almost strictly compatible,
     irreducible, odd".
   - For a system through the lift given by DP Theorem 1.11, oddness and irreducibility follow from those of the lift:
     - the members are semisimple and have the same Frobenius polynomials outside a finite set, so by Chebotarev and Brauer–Nesbitt
       a reducible member would make the 2-adic lift a sum of characters;
     - det ρ_ℓ = ψχ_ℓ with ψ independent of ℓ, so det ρ_ℓ(c) = −ψ(c) does not depend on ℓ.

     A proof step now says this.
   - The second hypothesis traced crystallinity at p ∉ S to the exception in the almost-strict condition. It comes from Definition
     1.10(4), which almost strictly compatible systems satisfy in full.
   - The statement now says that "Serre weight 2, not bad dihedral" concerns an irreducible ρ̄_p. A reducible ρ̄_p goes to
     Theorem 1.6.
   - The request to R24.3 ("odd by the parity conditions") is reworded to match.
2. **`R33.6/two-routes-comparison`.**
   - Item (2) said that the modern route "stops being independent of KW exactly" at the scalar dyadic case. That contradicts
     item (1), since the modern route already uses KW I Theorem 5.1 for lift existence.
   - It also misdescribes the plan. `R33.6/strong-form-by-the-modern-route` uses `R27.4/strong-form-by-minimal-lifts` (KW I
     Theorems 5.1(1) and 4.1) for every case of the refinement, not only the scalar one.
   - Item (2) now separates the two points:
     - both routes refine through R27.4;
     - that argument is indispensable only at ρ̄|_{D₂} scalar with non-dihedral projective image. Every other case was known
       before KW (DP p. 1: Edixhoven, Ribet, Boston–Lenstra–Ribet; KW I p. 2: Buzzard's mod-2 level lowering [6] and Wiese [42]).
   - A new hypothesis makes the distinction explicit, and the node cites E9.

`R33.6/strong-form-by-the-modern-route` was verified. Its hypothesis on the scalar dyadic case now cites E9. KW I state that case in
Theorem 1.2(2) but do not write its proof out; `R27.4/strong-form-by-minimal-lifts` supplies it.

## Source issues

No new source issues were found. One candidate was checked and rejected. DP give the Steinberg type as "(ω₁ ⊕ 1, (0 1; 0 0))" in
Theorem 1.9(2) and (4) and in Paso 4 (pp. 6 and 12). With ω₁ a nontrivial inertial character this would not be a Weil–Deligne
representation. However, DP define ω₁ on p. 5 as "the unramified quasi-character giving the action of W(ℚ_p) on roots of unity". So
the pair is the Steinberg Weil–Deligne representation, trivial on inertia and matching KW I's "(id, N)". The word "inertial" is loose,
but it is not an error.

## Remaining

The packet's gap stands: independence from the general Serre theorem depends on GL2ModularityLifting R32.6's globalisation audit
of the imported lifting theorems and of Dieulefait's compatible-system theorem.
