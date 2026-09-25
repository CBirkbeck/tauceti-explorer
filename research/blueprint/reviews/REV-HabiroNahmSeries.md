# Review: HabiroNahmSeries (Nahm series, asymptotics and Habiro integrality), stages HB.3, HB.4, HB.5a, HB.5, HB.8, HB.9, HB.10

Job `REV-HabiroNahmSeries` (issue #517), by Claude Code, session `cc-442dc5`, 25 September 2026. The packet was written by Claude Code, session cc-7b31c4 (`BP-HabiroNahmSeries`, issue #1011, PR #2876). I had no part in it. **Status: accepted**, after the corrections below, which were made in place. The packet stays `partial`. HB.5a is fully decomposed and the other six stages are `partial`. The open points are recorded as 22 gaps, 9 requests and 13 restructure entries.

## What was checked

- **Sources.** Each was downloaded as PDF and as arXiv e-print, and the hashes were confirmed.
  - **Calegari–Garoufalidis–Zagier (CGZ)**, *Bloch groups, algebraic K-theory, units, and Nahm's conjecture*, arXiv **v3**.
    - §1.3 and §7 were read in full. §1.2 was read for GSWZ's reference to CGZ (14), and v1 and v2 were compared there.
    - §§2–6 belong to HabiroNumberFields HB.1/HB.2, which the merged review REV-HabiroNumberFields (#2904) decomposes. This packet cites those nodes by id.
  - **Garoufalidis–Scholze–Wheeler–Zagier (GSWZ)**, *The Habiro ring of a number field*, arXiv **v2**.
    - Read in full: §§1.6–1.9, 2, 3 and 4.
    - Read where nodes cite them: §§1.1, 1.2 and 1.5.
    - The v1 TeX was compared at every statement quoted in a source issue, and it has the same text.
  - **Garoufalidis–Zagier (GZ)**, *Asymptotics of Nahm sums at roots of unity*, arXiv **v1** (the only version).
    - §§1–7 were read, and so was Appendix A, which proves the Kashaev–Mangazeev–Stroganov identity.
    - The packet's hash is that of the PDF, and the e-print hash is recorded separately.
  - The published versions of CGZ and GZ were found through Crossref, but their text could not be accessed. This is recorded in `sourceVersions`.
- **Checkers.** Four worked in parallel. Each compared locators and excerpts with the source, opened every cited declaration at Mathlib 082e2d3 and Tau Ceti f790474, and read the supplier stages and sibling packets. They computed with mpmath and PARI/GP.

  | Checker | Scope |
  |---|---|
  | A | HB.3 (8 nodes), HB.4 (13 nodes), GZ and CGZ §7 |
  | B | HB.5a (7 nodes), HB.5 (8 nodes), the pinned modular-forms library, CGZ §§1.3 and 7 |
  | C | HB.8 (17 nodes), GSWZ §2 |
  | D | HB.9 (12 nodes), HB.10 (9 nodes), GSWZ §§1.7, 3 and 4, and the packet-level fields |

- **What I checked myself** (PARI/GP at 60 digits, or exact arithmetic).
  - **The Euler-product phase behind GZ Theorem 3.1** (E1, E5). At q = e(a/m)e^{−ε/m}, ε = 0.05, 1/(q;q)_∞ equals e(s(a,m)/2)(ε/2π)^{1/2}e^{π²/(6mε)}e^{−ε/(24m)} to 60 digits for (a, m) = (1,3), (2,3), (2,5), (4,5) and (3,7). The printed χ is off by e(1/12) at α = 2/3, by −1 at α = 4/5 and by e(−3/7) at α = 3/7.
  - **The level-2 counterexample to GSWZ Theorem 7** (E28). For F = Σ_j t^j/(q;q)_{2j}, the unique expansion (92) gives L₂ = (q³ + 2q − 1)/(2(1 − q)²(1 − q³)(1 + q²)). This has a pole at Φ₄ although 4 ≡ 0 (mod 2).
  - **The solution order in CGZ Theorem 7.4** (E16). The residuals of 1 − X = X^{A_n} are 0.160, 0.230 and 0.253 for n = 7, 9, 11 in the printed order, and 0 in the order (X₂, …, X_{r+1}).
  - **GSWZ (43)** (E45), computed exactly in ℤ[ζ_{6m}]. S²/m is a square for m = 5, 13 but not for m = 7, 11, while S²/m* is a square in every case.
  - **Smaller checks:**
    - 1/δ = (2z² + 3z − 9)/(27t − 4) in ℚ(t)[z]/(tz³ − z + 1) (E49);
    - nfdisc = −5²·19 for the quartic field (E50);
    - G₄ = −2 (E53);
    - the critical value 4/27 for A = 3 (E35);
    - the √2 in the partition case of GZ (46) (E12).
- **Ownership and cycles.** A validator checks that:
  - every prerequisite resolves, and every stage prerequisite has a request;
  - every gap names nodes, and every node id mentioned in text exists;
  - the node graph is acyclic and follows the stage order;
  - no path leads from a cross-roadmap prerequisite back to a HabiroNahmSeries stage at or after the citing one, following node prerequisites, atlas `requires` and every restructure link.

  The checkers' additions created two cycles, and I broke both:
  - HB.5's meromorphy lemma cited HB.5/expansion-at-one, whose part (b) uses the lemma. It now uses HB.4/radial-asymptotic-expansion at m = 1.
  - C's new periodicity lemma and the FGI collection cited each other. The collection is now defined first, and the lemma proved after it.

  No cycle remains. The HabiroNumberFields HB.2 ↔ HabiroNahmSeries HB.4 question is recorded under Questions below.
- **Checks.**
  - `python3 scripts/check_blueprint.py --index <pinned declaration index> research/blueprint/packets/HabiroNahmSeries.json` reports 0 errors and 0 warnings. The original packet also passed; the checker does not test statement truth, test kinds, excerpt length, locators or cycles.
  - The source issues pass `scripts/check_errata.py` on a copy of the list.
  - `research/blueprint/intake.py check-files` passes on the three deliverables.

## Counts

| | before | after |
|---|---|---|
| nodes | 74 | 109 (71 corrected, 38 added, 3 deleted) |
| API items | 143 | 177 |
| unit tests | 84 (none with a kind) | 125 (all with a kind) |
| planets | 25 | 22 (at most 6 per layer) |
| sources | 3 | 3, with 11 `sourceVersions` |
| baseline declarations | 46 | 94 (all with `kind` and `checked`) |
| requests | 24 (none with `neededBy`) | 9 |
| gaps | 10 (stage ids as `neededBy`) | 22 (node ids) |
| source issues | none | 63 |
| restructure entries | 5 (not in the protocol format) | 13 |
| excerpts over 300 characters | 59 | 0 |

Added nodes by stage: HB.3 4, HB.4 8, HB.5a 1, HB.5 3, HB.8 13, HB.9 7, HB.10 2.

## The main corrections

**Statements that were false.** Most came from the sources and are recorded as source issues. The nodes now state the corrected form.

- **HB.4, GZ Theorem 3.1.**
  - The root of unity is χ_α = e(s(a,m)/2), where s is the Dedekind sum; the printed value is right only for α = 1/m.
  - The all-orders series was missing e^{−Nε/(24m)}, had the wrong sign on the B-term, and did not exponentiate ψ.
  - GZ Proposition 2.2 was wrong in four places, and the lattice-sum constant in Claim 4 was wrong.
  - The coefficient-versus-radial node was false as stated and was not a stage target, so it is deleted.
- **HB.4, CGZ Theorem 7.1.**
  - It needs n odd.
  - Its fixed μ fails when Q is not integer-valued.
  - (44) takes an n-th root of a class, so it is restated as a statement about classes.
- **HB.4, D_ζ(1).** D_ζ(1)^{24m} = m^{12m} is false in CGZ's normalisation, where D_ζ(1)^{24} = m^{12m}.
- **HB.5.**
  - In the comparison of expansions, the phase is e(−λc/d), and ω and the factor q^C were missing.
  - The expansion must hold uniformly for complex ε.
  - GZ's C₀(A) has the wrong sign.
  - CGZ's "modular" means invariance only, so a new lemma proves that an invariant Nahm sum is meromorphic at every cusp.
  - CGZ Theorem 1.2 belongs to HabiroNumberFields HB.2, not HB.1.
- **HB.5a.**
  - "The widths sum to the index" is false when summed over cusps.
  - The growth formula was wrong, and its uniform form was missing.
  - The modular functions were given a "field" API, but they form a ring.
- **HB.8.**
  - GSWZ Theorem 7 is false as printed (E28), so level-m admissibility uses a corrected ring.
  - The constant U_m (67) has the wrong sign, and the phase in (121) is wrong.
  - The multivariable Riccati system (89) and the Hessian identity (169) are false as printed.
  - The order-m q-difference equations (98), (137) and (165) have the wrong sign.
  - The t-deformed equations use the index z_i, not z_j (E36).
  - The product expansion was stated over the Laurent series field.
- **HB.9–HB.10.**
  - Corollary 1.10 is false: the constant term needs δ^{−1/2} and the Kummer root. The "constant term is the unit" node was therefore false, and it also cited CGZ (14) where the displays used are (12)–(13).
  - (212)–(213) and (223) are misprinted.
  - (229) is off by a factor t, and (280) is a false equality.
  - (289)–(290) have the wrong value for 4 | m.
  - The quartic discriminant is −5²·19.
  - The symmetrisation node bundled four corollaries, one of them false, so it is replaced by four nodes.

**Library.**
- The packet claimed that Poisson summation is absent from the pinned libraries. Mathlib has it in one dimension (`Real.tsum_eq_tsum_fourier_of_rpow_decay`, `SchwartzMap.tsum_eq_tsum_fourier`, `Complex.tsum_exp_neg_quadratic`), and these are now cited.
- HB.5a had re-planned Mathlib's arithmetic subgroups, cusps and widths. It now builds on them.
- The q-Pochhammer symbols belong to QSeriesPartitionsAndMockModularForms QM.0. HB.4's node became a comparison, and I removed its leftover API, which included an identity that is meaningless for |q| < 1.
- Four baseline entries that no node cites any more were dropped: `PadicInt`, `StrictConvexOn`, `StrictConvexOn.eq_of_isMinOn` and `IsCompact.exists_isMinOn`. I wrote the `provides` text for 12 cited declarations from their statements at the pin.

**Closure.** New nodes cover the steps that had none:
- the non-degenerate discriminant, the algebraicity of non-degenerate points, and Suslin's convention for the Nahm element;
- the Euler–Maclaurin remainder, Gaussian moments, lattice sums by Poisson summation, and the tail bound;
- Kummer invariance, Galois equivariance, and the Andrews–Gordon constant;
- the order at a cusp, and the meromorphy lemma;
- the formal Pochhammer symbol, the Laurent expansion at a root of unity, the congruence sums, the ratios with their corrected Riccati system, and the plethystic logarithm;
- pole location, residues, the ring S, the periodicity lemma, the level-m Dwork lemma, and recognition of admissibility;
- the Frobenius lift and the specialisation at t = 1;
- the p-adic regulator identity, the four corollary nodes, the figure-eight example, and the rank-one product identities.

**Deleted.**
- `HB.4/coefficient-versus-radial-asymptotics` was false as stated and was not a stage target.
- `HB.9/p-adic-polylogarithm-integrality` duplicated HabiroNumberFields `HB.7/pochhammer-dwork-difference`.
- `HB.9/symmetrisation-and-torsion-corollaries` bundled four statements, one of them false.

**Requests and suppliers.**
- #2904 has merged, so HabiroNumberFields is now cited by node id: HB.1/the-excluded-primes, HB.2/the-cyclic-quantum-dilogarithm, R-injectivity-and-image, and the HB.6/HB.7 nodes. The phrases "once #2904 merges" were removed.
- Nine stage-level requests remain: P.1 (the real Rogers dilogarithm and Zagier's II.2C identity), QM.0 (the Andrews–Gordon identity), R.4, V.4, D.1, D.3, D.4, L2 and QT.5.
- The rest were dropped, for these reasons:
  - HR.2 was unused;
  - HR.6, HQ.5, HQ.8 and QT.7 are consumers of HB.10, not suppliers, and QT.7 → QT.6 → HB.9 would have inverted a link;
  - HC.1 and HC.2 were misdirected, and QM.0 node ids replace them;
  - QM.2 served only the deleted coefficient-versus-radial node;
  - the other requests are now node-id prerequisites.

**Gaps.**
- Four of the packet's ten gaps are retired:
  - "CGZ Sections 2 to 6" and "Hutchinson's comparison", because REV-HabiroNumberFields read both and the remaining obligation is D's gap "The constant term and the Kummer value";
  - "no textbook for cusps", because HB.5a now rests on the pinned declarations;
  - "two printed slips", which are source issues E36 and E50.
- The other six are retargeted to node ids. The Poisson-summation gap is corrected: only the N-dimensional lattice form is missing from the libraries.
- Sixteen gaps are new. Among them are:
  - the proof of the corrected level-m theorem;
  - the p-adic regulator identity V(1) = D_p(ξ);
  - the linear coefficient required by the corrected shape (195);
  - GZ Proposition 7.1 at the other cusps;
  - the Andrews–Gordon identity at general modulus.

**Excerpts.** 59 of the packet's excerpts exceeded the 300-character limit. The checkers' corrections replaced or removed 28 of them. I shortened the other 31 to literal segments joined by "…", and in two cases rewrote the `match` to say what the shortened excerpt still shows.

## Mistakes in the sources

There are 63 entries, all with `review.verdict = confirmed`. Two were found by two checkers independently and merged: CGZ Theorem 7.1's 'n odd' (E14), and the index in GSWZ (34)/(41) (E36). No erratum was found for any of the three papers.

- **GZ (16).**
  - **E1–E2:** Theorem 3.1's χ and its all-orders series.
  - **E3–E5:** Proposition 2.2 and the Euler denominators.
  - **E6:** the field of definition (21) is not proved.
  - **E12:** the formula (46)/(50).
  - **E13:** the minor-arc hypothesis.
  - **E23:** the sign of C₀(A).
  - **E24:** Proposition 7.1 at the other cusps.
  - Misprints: E7–E11 and E26.
- **CGZ (11).**
  - **E14:** Theorem 7.1 needs 'n odd'.
  - **E15:** (44).
  - **E19–E22:** the proof of Theorem 7.5 (phase, ω and q^C, complex ε, 'modular').
  - Misprints: E16–E18, E25 and E27.
- **GSWZ (36).**
  - **E28:** Theorem 7 is false as printed.
  - **E29–E30:** U_m (67) and the phase of (121).
  - **E31–E33:** (89), (169), and (98)/(137)/(165).
  - **E44–E46:** Corollary 1.10, (43), and the constant term in Theorem 5's proof.
  - **E52:** (280).
  - **E53:** (289)–(290).
  - **E55–E59 and E61:** Corollary 1.11's δ, the converse, Remark 3.11, the linear coefficient, (170), and the gluing at 2 and 3.
  - **E54:** the p-adic regulator identity V(1) = D_p(ξ) is asserted without proof.
  - **E38–E40:** the polar part at ζ_{am}, the range of m′ in Theorem 8, and the induction in Theorem 6.
  - Misprints: E34–E37, E41–E43, E47–E51, E60, E62 and E63.

## Lean

`research/blueprint/suggested/HabiroNahmSeries.lean` was rewritten against the final packet. It has 2224 lines and imports only individual Mathlib modules. The original imported two `TauCeti.*` modules and said it had not been compiled. It also had 280 statements of type `True`.

The new file assembles the four checkers' drafts, which I made compile, and adds the remaining names. Fixes to the drafts:
- a `FunLike` field name, and an ambiguous `I`;
- a `RatFunc` scoped instance, and an elaboration-order problem;
- a cyclotomic `zeta` with its instance passed explicitly, because instance search does not find it at the pin;
- `AdjoinRoot` division rewritten as multiplication;
- a line that Lean parsed as a subtraction continuing the line before.

Checker B's stand-ins for HB.3–HB.4 objects are tied to checker A's declarations by bridge lemmas. Some checker names differed from the packet's API names (for example `summable_nahmSum`), and these were renamed to the packet's names.

I elaborated the file with the Lean toolchain of Mathlib 082e2d3 (v4.34.0-rc2), with `LEAN_PATH` pointing at a prebuilt Mathlib 082e2d3; nothing was built. The result was exit 0 with 273 warnings, all "declaration uses `sorry`".

**Coverage.** A scripted check finds every node id, API item and test of the packet in the file, and no statement of type `True` or `Prop := sorry`. Items that cannot be stated honestly without another roadmap's objects are listed as `-- name: not stated; needs …`. These objects are:
- the Bloch groups;
- the Bloch–Wigner function on ℂ;
- P_ζ and R_ζ;
- the Habiro ring and its modules;
- the p-adic dilogarithm;
- the formal Gaussian bracket over ℚ(ζ_m, z^{1/m})[[t]].

## Questions for the orchestrator

1. **HabiroNumberFields HB.2 and HabiroNahmSeries HB.4.** CGZ Theorem 7.4 (R_ζ(η_ζ) = ζ²) is proved only through HB.4's asymptotics. GZ Appendix A proves the KMS identity through HB.4/pochhammer-radial-asymptotics. Both feed HabiroNumberFields HB.2, and HB.4 cites HB.2's cyclic dilogarithm. Restructure entry R2 supports the HB.2b stage that REV-HabiroNumberFields proposed. Until that stage exists, both inputs remain gaps on the HabiroNumberFields side.
2. **Atlas `requires`.** HB.4's nodes use P.1, QM.0, QM.1 and HabiroNumberFields HB.2, and HB.8's use HB.4, QM.0 and HB.2. The atlas lists only HB.3 and P.1 for them. Restructure entries record the needed links.
3. **Root-of-unity Pochhammer asymptotics.** Checkers A and D both assign these to HabiroNahmSeries HB.4, and RS-10 (not accepted) assigns them to HabiroNumberFields HB.2.
4. **HB.10's "one rational example".** GSWZ has no Nahm example over ℚ (restructure R1). The stage text should name the figure-eight, quartic and cubic data.
5. **Duplicated notions.** Weight-zero weakly holomorphic modular functions are planned both in HB.5a and in QSeriesPartitionsAndMockModularForms QM.3 (restructure, merge).
6. **Exports.** HB.10's exports to HabiroRings HR.6 and HabiroCohomologyFoundations HQ.5–HQ.8 have no source. Wagner's relative Habiro ring (arXiv 2410.23078) is the likely input (gap).

## Summary

The review accepted the packet after correcting it in place: 71 nodes corrected, 38 added and 3 deleted. Many statements were copied from sources that are wrong as printed:
- GZ Theorem 3.1's root of unity and all-orders series, and Proposition 2.2;
- CGZ Theorem 7.1's missing "n odd", and the sign of GZ's C₀;
- GSWZ Theorem 7, which needs a corrected ring;
- U_m (67), the phase of (121), and the systems (89), (98) and (169);
- Corollary 1.10, and (229), (280) and (290).

63 source mistakes are recorded, with the key ones recomputed by the reviewer. HB.5a now builds on Mathlib's cusp library instead of re-planning it. Poisson summation is cited. HabiroNumberFields is cited by node id. Consumers are no longer listed as prerequisites. Closure added 38 nodes. The packet stays partial, with 22 gaps (among them the level-m proof, the p-adic regulator identity and the constant-term identification) and 9 requests. The Lean file elaborates with `sorry` as its only warning.
