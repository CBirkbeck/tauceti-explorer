# REV-RS-25 — review of the RS-25 restructuring (Néron models and scheme and stack foundations)

**Verdict: accepted, with one correction made in place.** Reviewer: Claude Code, session `cc-442dc5`, 23 September 2026. The proposal was written by ChatGPT Pro, session `cg-6b83f1`. This reviewer took no part in it.

**What was read.**
- `RS-25.json`: two members, two anchors (EllipticCurves and StableReduction) and fourteen directed leads.
- The proposal `RS-25.result.json` and its report `RS-25.md`.
- Both member documents with all their layer descriptions: NeronModelsAndSemistableAbelianVarieties R11.1–R11.6 and SchemeAndStackFoundations SF.0–SF.6.
- The anchor and supplier layers the proposal names:
  - EllipticCurves Layer 4 (reduction, Tate's algorithm, the Tate curve);
  - StableReduction Layers 2 and 6–9;
  - ArithmeticGaloisRepresentations R01.3.
- Tau Ceti ModularCurves 0E and the AlgebraicCurves layer list, which the proposal does not name.
- The other restructuring proposals that touch R11 or SF layers: RS-02, RS-06, RS-17 and RS-18 (unreviewed), and RS-22 and RS-32 (accepted).

**Checks run.**
- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-25.result.json` reports `ok` before and after the correction.
- `apply_restructurings` from `scripts/restructure.py` on `data/atlas.json`, with the twelve accepted proposals in `data/restructure/` applied first. All 60 links apply, and none is skipped for a missing endpoint or a cycle.
- The same simulation with every unreviewed proposal added, with RS-25 both in sorted order and applied first. RS-25 skips nothing, and it changes no other proposal's skipped links.

## 1. Duplication

Every lead is resolved with one owner.
- **R11.1 / SF.4 (Néron models).** R11.1 owns them. SF.4 said "Route Néron models and stable reduction through existing owners", and now imports them.
- **R11.3 / SF.4 and StableReduction Layer 7 (semistable reduction).** The owners split cleanly:
  - R11.3 owns general abelian semistable reduction and the monodromy criterion.
  - Layer 7 owns nodal reduction of curves and its separately scoped curve–Jacobian criterion.
  - Layers 8 and 9 own stable and pointed stable reduction.

  SF.4 listed "semistable reduction" among its own constructions, and loses that.
- **R11.2, R11.5, R11.6 / EllipticCurves Layer 4.** Layer 4 owns the equation-level objects: E₀, E₁, `ReductionSymbol`, Tate's algorithm, c_p = [E(K):E₀(K)], and Néron–Ogg–Shafarevich in its three elliptic statements. Its text explicitly leaves the geometric Kodaira comparison with the Néron model, and the ramification-theoretic conductor, to other projects. So R11.2 and R11.6 rightly own the comparisons, and R01.3, whose text includes "the precise comparison with the conductor of an elliptic curve", owns the conductor comparison.
- **R11.4 / SF.3 and StableReduction Layer 6.** SF.3's own text covers smooth Picard schemes and Jacobians, integrating JacobianChallenge, so it keeps them, with owner JacobianChallenge Layer D. R11.4 owns the semistable degeneration theory. Layer 6 owns numerical types and weighted Pic(T).
- **SF.0 / StableReduction Layer 2.** Layer 2 plans "projective morphisms and relative `Proj` of a finitely generated graded quasi-coherent algebra". SF.0 keeps only the general relative Proj and the missing relative Spec.
- **SF.1 / StableReduction Layer 2.** Layer 2 plans effective étale descent of schemes with a compatible relatively ample invertible sheaf. SF.1 keeps the broader descent and the algebraic-space/stack interfaces.
- **SF.5 / StableReduction Layer 4.** The proposal adds an owner split for arithmetic-surface intersection theory that is not among the leads. It is right.

**A missed duplicate, corrected.** Tau Ceti ModularCurves 0E ("Effective descent and spreading out") plans effective faithfully flat descent, with cocycle and uniqueness statements, for:
- affine schemes;
- finite locally free schemes and closed subschemes;
- sections and morphisms;
- polarized projective relative curves;
- group objects;
- finite group actions and torsors.

It also plans the corresponding spreading-out. The narrowed SF.1 still kept "effective fpqc/fppf descent for explicitly specified effective object classes beyond the polarized etale case", which includes these classes. ModularCurves is not an anchor of this family, so the lead generator missed it. §2 records the correction.

## 2. Nothing lost

**The narrowings.**
- **SF.0** keeps relative Spec, the general relative Proj and the named-arrow checks, and reuses the audited carriers.
- **SF.1** keeps the broader effective descent classes, algebraic-space quotients, representable diagonals, atlas independence and the stack/moduli distinctions.
- **SF.4** keeps deformation theory, formal schemes and algebraization, alterations and modifications. Each reduction output is a named import from its owner.

**Consumers.** Every consumer of a narrowed layer receives links from each of its suppliers:
- SF.0: DY.0, HL.5, LD.6, RD.3, SF.1 and TB.4.
- SF.1: DM.3, GS.0, LD.3 and SF.2.
- SF.4: DM.3, GS.0, SF.5 and TB.2.

The R11 layers are all kept, so their outside consumers are untouched.

## 3. Links, anchors, format

- **Links.** All 60 endpoints resolve, and all 60 are new edges. No link closes a cycle, including against the accepted RS-32 links out of R11.3 and the unreviewed RS-02, RS-06, RS-17 and RS-18.
- **Anchors.** No Tau Ceti layer is changed, and no roadmap is extended, merged or retired.
- **Consistency with other proposals.** The owners agree with:
  - RS-17 (R11.4 for the generalized Jacobian and monodromy pairing; SF.5 for the surface intersection route);
  - RS-18 (SF.5 for Chow/Chern/Gysin);
  - RS-32 (R11.3 for the Raynaud extension and uniformisation).
- **Format.** The JSON follows PROTOCOL §15. There are two `keep` roadmaps, three `narrow` layers each with `keeps` and `suppliedBy`, and 25 owners, each a single stage.

## 4. Correction made

All in `research/blueprint/restructure/RS-25.result.json`.

1. **`layers[SF.1]`.**
   - `suppliedBy` now also names `tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out`.
   - `keeps` excludes the ModularCurves 0E classes, as it already excluded the polarized étale case.
   - `reason` records the correction.
2. **`owners`.**
   - A new entry gives ModularCurves 0E ownership of effective faithfully flat descent for its listed classes, formerly SF.1.
   - The SF.1 owner entry now reads "beyond that polarized etale case and the ModularCurves 0E classes".
3. **`links`.** Five links were added:
   - ModularCurves 0E → SF.1, a named import;
   - ModularCurves 0E → DM.3, GS.0, LD.3 and SF.2, forwarding to the consumers of the narrowed SF.1 in the proposal's own convention.

   ModularCurves 0E depends only on Mathlib, so none of these can close a cycle.

## Questions for the orchestrator

1. **Forwarded links are coarse.** The forwarding links make SF.4's consumers (DrinfeldModules DM.3, GlobalShtukas GS.0, TropicalAndBerkovich TB.2, SF.5) downstream of R11.1, R11.3 and StableReduction Layers 7–9. R11.1 and R11.3 are Néron models and abelian semistable reduction over number-field and DVR bases. The proposal labels these links "inherited interface, not a claim that every supplier theorem is used". Each consumer's blueprint should keep only the edges it uses; GS.0 in particular is function-field geometry.
2. **SF.4 now depends on R11.1 and R11.3.** It does so through the named-import links R11.1 → SF.4 and R11.3 → SF.4. If R11.1's smoothening proof later needs SF.4's formal algebraization, that would create a cycle. The fix would then be to move SF.4's re-export of reduction outputs to a consumer-facing layer, not to reverse the edge.
3. **SF.3 has no link from AlgebraicCurves.** SF.3 "integrates AlgebraicCurves and JacobianChallenge", but the atlas has no edge from any Tau Ceti AlgebraicCurves layer into SF.3, and the proposal adds only JacobianChallenge D and F. The AlgebraicCurves layers for divisors, Riemann–Roch and genus (layers 3–5) look like the intended suppliers. Choosing the comparison between function-field and scheme-theoretic divisors is a blueprint decision, so it was not added here.
4. **Two Tau Ceti roadmaps overlap each other.** StableReduction Layer 2 (effective étale descent of polarized schemes) and ModularCurves 0E (effective faithfully flat descent of polarized projective relative curves) overlap. Tau Ceti roadmaps are not re-planned here, but a consumer should import one of them, not both.
