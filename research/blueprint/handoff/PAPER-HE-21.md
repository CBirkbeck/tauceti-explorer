# PAPER-HE-21 handoff

Codex — `codex-c83e7a`; issue #1397. Published-paper reading completed; submission is **partial**.

The two paper deliverables contain 105 items (7 library, 10 planned, 88 missing), eight source routes and two Part II briefs. Every definition/construction has an API and tests. 85 missing items and all 10 planned items are routed. No Lean implementation or compilation is claimed.

## Resume here

1. **/61, G1, auxiliary lattice:** He21 §5.2–5.4 defines fundamental coweight sums and then translates by them. For SL2, `ρ∨_{s}=α∨/2` is not in the actual cocharacter lattice. Read GHN15 §§2.2–2.5 **with** its 2017 erratum (links and hashes in the JSON/report), then prove the needed adjoint/enlarged-lattice comparison for the precise equal/mixed-characteristic geometric carrier. The corrected equal-characteristic comparison is componentwise and has the prime restriction; the original mixed-characteristic paragraph only gives a set bijection. Check descent of γ, κ, dimensions and the double-flat operator. Do not silently impose an adjoint hypothesis on the published main theorem or assert the original lattice contains all fundamental coweights.
2. **/69, G2, bounded correspondence:** For X2→X3 and X4→X5 in §5.4, exhibit finite-type or perfected finite-type convolution models over each relevant component and verify the generic-fiber dimension theorem. The union of exceptional closed subsets in argument (a) must be finite or replaced by a correct argument. SF.0 owns the generic dimension lemma; GS0 owns the bounded flag geometry. Route this specific bridge only after the hypotheses are settled.
3. **/92, G3, basic seed:** Read a source giving nonemptiness of `X_{at^γ}(τ)` for the actual reduced element, or modify the reduction to guarantee the cited theorem’s hypotheses. He15 Thm2.27 requires shrunken. In adjoint split A2 take `λ=ω2∨`, `x=s2s1`, `y=1`. The construction gives `a=s1s2`, `γ=λ`; the original alcove is shrunken but the reduced alcove is not. In simple-root coordinates on `u<0,v<0,u+v>−1`, the two images are `(v−1,1−u−v)` and `(1−u−v,u)`. Both finite parts have full support. This invalidates direct application of the cited theorem to this construction, not the main result. The rank-one concern was rejected: `s a=(0,1)` is shrunken in this convention.
4. Finish original-source proof decomposition for HN14, He14, Vi14, GH10 and the Newton-purity/completion inputs of MV20; read the exact GW10 edition or a verified equivalent dimension theorem. Preserve the broader Iwahori–Weyl combinatorial transfer explicitly described by He21 §1.5, rather than retaining old source restrictions forever or erasing them without proof.
5. Check full dependency coverage, route each remaining missing item exactly once, update the briefs if the correct proof changes their scope, and only then consider `status: complete`.

## Corrections to retain

- Published PDF is the source; §§2.1–2.2 are pp.4–5, §§3.1–3.4 p.6, cordiality p.7, normalized subtraction p.8, and the main proof pp.13–14.
- Use `(J,x,σ)` with the normal-form left factor in §6.2, as in GHN15 Lemma3.6.3. Then `x⁻¹wσ(x)=t^λσ(ησ(w))`.
- Keep closure bars in §4.3, coroots/nonnegative coefficients in Prop.5.1 and a leastness/existence proof.
- Saturation needs a known nonempty lower endpoint. Distinguish the I-normalized Newton-stratum dimension from ADLV dimension.
- No uniqueness of Levi σ-classes for a nonbasic G-class; the GHN erratum gives a GL2 counterexample.
- The pinned library already has Bruhat order, chambers, dominant representatives, wall stabilizers and positive-cone finiteness. Import them. The local-group identification and ADLV geometry are separate missing interfaces.

## Reproduction

The report contains hashes, exact source links, pinned library commits, owner commit, proof examples and route rationale. All computations are reproducible from the matrices `s1=[[-1,0],[1,1]]`, `s2=[[1,1],[0,-1]]` on A2 coweight coordinates. The finite tests covered 729 A2 subtraction triples, 512 A1 triples, 216 A2 Demazure triples and 570 shrunken-input reductions, with 34 non-shrunken outputs. These are finite evidence, not a general proof.

Run the paper validator and `research/blueprint/intake.py check-files` on the exact three deliverable paths from the repository root. Assert the files actually exist before interpreting the latter’s success. Refresh current atlas ownership and reserved IDs before proposing any new route. Only this job’s paper JSON, report and handoff are authorized deliverables.
