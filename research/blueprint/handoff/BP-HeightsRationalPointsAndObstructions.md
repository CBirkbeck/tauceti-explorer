# BP-HeightsRationalPointsAndObstructions — second checkpoint: RP.2, affine case

Agent: Claude Code, session cc-fb70e5, 2026-09-28. Refs #1031. The claim is comment 5873388279, confirmed by the bot. The previous checkpoint (Codex, codex-hjdg0j, 2026-09-27) is summarised at the end, and its full text remains in the history of this file.

## What this checkpoint adds

The component adds 16 RP.2 nodes, which close the dependency chain from the pinned libraries to the inclusion of rational points in the Brauer–Manin set, for affine varieties over a number field. It has the following parts:

1. **Points topology.** A topology on points with values in a topological algebra, taken as Conrad's explicit description (Proposition 2.1), so that no presentation is chosen. The node proves independence of the presentation and closed embeddings into affine space, and gives the value-ring change of Conrad's Example 2.2. That example's closed/open clause has the two rings exchanged, which is recorded as source issue E8, a new misprint in Conrad's author copy.
2. **Adelic points.** Adelic points X(𝔸_K) = Points_K(A, 𝔸_K) of an affine variety, with its diagonal and local projections, together with:
   - integral models, and their existence and agreement at almost all places;
   - a homeomorphism with Mathlib's `RestrictedProduct` of the local points with respect to the integral points (Poonen §2.6.3 and Exercise 3.4; Conrad Theorem 3.6);
   - the local solubility criterion;
   - discreteness and closedness of X(K), from Tau Ceti's theorem that K is discrete and closed in 𝔸_K.
3. **Brauer evaluation.** Brauer classes are Azumaya algebras over the coordinate ring (Mathlib `IsAzumaya`).
   - A lemma gives base change of Azumaya algebras, and shows that over a field they are exactly the central simple algebras.
   - Evaluation at a point lands in Mathlib's Brauer group of a field, with Tau Ceti's group structure and base change. It satisfies naturality, multiplicativity, pullback and constant-algebra rules.
4. **Finite support.** An Azumaya algebra spreads out over an integral model; Azumaya algebras over O_v are split, using Br(𝔽_q) = 0 and idempotent lifting; and so evaluation at an adelic point is trivial at almost all places (Poonen Proposition 8.2.1).
5. **Pairing.** The Brauer–Manin pairing, the Brauer–Manin set and the obstruction, and the inclusion of the diagonal image of X(K) in the Brauer–Manin set (Poonen Proposition 8.2.2 and Corollary 8.2.6).

The packet now has 24 nodes and 78 baseline declarations, 55 of them new. There are 14 gaps and 2 requests. RP.2's coverage is partial, and every other stage is as before.

## Requests and gaps

**Requests** go to the Tau Ceti ClassFieldTheory roadmap:

- the local invariant inv_v at finite places, from Layer 5;
- the reciprocity law Σ_v inv_v(res_v β) = 0, from Layer 10.

In the suggested file these appear as marked stand-ins, and as an explicit hypothesis `hrec` of `diagonal_mem_brauerManinSet` that the Layer 10 theorem will discharge. No invariant map is constructed here.

**New gaps:**

- the comparison of the Azumaya Brauer group with Poonen's cohomological Br X = H²_ét(X, 𝔾_m) (Gabber and de Jong);
- compactness of O_v for a number field, which neither pinned library states and which only the local-compactness API items need;
- the henselian input for local constancy of evaluation (Poonen Proposition 8.2.9).

The previous RP.2 gap "Adelic evaluation and unramified finite support" is updated to say what is now built.

## Sources

- **Poonen, *Rational points on varieties*.** The author PDF, whose sha256 matches the one recorded in the previous checkpoint; printed page = PDF page − 14. Read in full: §2.6.3, Exercise 3.4, §6.6.2–6.6.3, §6.9.1, §8.1 and §8.2.1–8.2.4.
- **Conrad, *Weil and Grothendieck approaches to adelic points*.** The author copy, file dated 2011-12-31, sha256 fe4a9193…a9bb. Read in §1–§3 through the proof of Theorem 3.6; page 3 was rendered to confirm E8.

Every excerpt was compared with the extracted text. The lower mechanical scores come only from pdftotext's joining of subscripts.

## Validation

- `check_blueprint --index` against the pinned declaration index gives 0 errors and 0 warnings.
- The intake file check is clean for the four files.
- Every node's declaration name appears in the suggested file.
- **The suggested file was not compiled.** The shared machine has no pinned build, and its rules forbid building one. The new section imports Tau Ceti modules; the previous checkpoint's Mathlib-only part compiled under Lean 4.34.0-rc2 when it was written.

## Resume

For RP.2, the next steps are:

1. Local constancy of evaluation and closedness of the Brauer–Manin sets (Poonen Proposition 8.2.9 and Corollary 8.2.11), with the henselian Azumaya input.
2. The non-affine theory (Conrad §3 gluing; the proper case X(𝔸) = ∏ X(K_v)).
3. The Azumaya/cohomological comparison.
4. The acceptance examples: a conic, imported from Tau Ceti GlobalQuadraticForms Layer 5, and Iskovskikh's surface.
5. The Harpaz–Wittenberg items.

`AdelicAlgebraicGroups:AA.1` should import RP.2/points-topology and RP.2/adelic-points for G(𝔸), rather than build a second topology.

RP.0, RP.1 and RP.3–RP.6 are unchanged from the previous checkpoint. Its resume notes still apply: start RP.0 at the geometric height-machine gap, and keep the RP.1 and RP.3–RP.6 source work.

## Previous checkpoint (Codex, codex-hjdg0j, 2026-09-27), in brief

The first checkpoint built 8 RP.0 nodes on the real vector space of height functions modulo bounded functions (`TauCeti.HeightClass`, using Mathlib's `Filter.boundedFilterSubmodule`). It covered the equality criterion, pullback, injectivity along surjections, and Northcott transfer and invariance. Its source was de Jong's *Notes on Heights*, with seven source findings (E1–E7). Its Lean section compiled under Lean 4.34.0-rc2. It proposed a rescope with GrossZagier GZ.1 and GZ.2, and one for RP.6.
