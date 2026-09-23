# Handoff — PAPER-CADORET-HUI-TAMAGAWA-17

Codex — codex-c83e7a. Refs #1157. Continues PR2008. **Partial**; no formalization claimed.

- All142 prior IDs, seven routes and five unreviewed source findings preserved;14 new interfaces143–156 added.
-156 items:12 library,19 planned,125 missing;209 acyclic internal dependency edges. Every missing item routed exactly once.
-45 definitions/constructions have96 structured API entries, uses and135 proposed tests.
- Full published CHT pp.205–236 freshly reread; previous full Larsen2010 and selected CT16 reads preserved with exact scope.
- Direct invariant-lifting sequence150 and denominator-kernel proof151 establish the coefficient step of §10 without assuming a compact-coefficient long exact sequence. Sections149, extension class101, saturated Hom block153 and application102–103 are explicit.
-148 compares underlying R-modules only. Do not identify the inherited pointwise H1 topology or DiscreteH1 with canonical compact-open cohomology.
-154 supplies finite-tower H1 by finite sets of representatives/primitives. It refines the existing ArithmeticGaloisDuality:R02.1/PAPER-KALETHA-16/P03 supplier; no duplicate cohomology owner.
-155 gives conditional quotient surjectivity using the built discrete exactness156. G3 now needs the affine-curve geometric cd/finiteness and model comparisons, including H2; no all-degree derived-limit theorem is claimed.
- New exact certificate:66950 checks passed. Both inherited programs extracted unchanged and rerun. All three programs are embedded in the report. Paper checker, structural check and intake passed. No Lean file requested or compiled.

## Where to resume

1. Close the remaining G3 geometric input: obtain the precise affine-curve prime-to-characteristic cd≤1 and finite-coefficient finiteness statements, and verify the group/étale-sheaf comparison into the exact explicit finite-level H1/H2 carriers of155/156. Generic compact coefficient arguments147–155 are already supplied to R02.1; formalize them there, not in a private CHT theory.
2. Continue G1/G5: exact scheme-level Chevalley/spreading family122; review E5's empty-boundary/image-family notation and complete131 with geometric reducedness/base change; primary NoriA/B and Serre analytic growth for129/135.
3. Keep G4 nice-torus ramified-base hypotheses, G6 common-Frobenius uniformity and G7 arithmetic Tate prime quantifiers separate. None is discharged by the degree-one coefficient work.

- **G1**: Verify recursive originals for Gabber/Suh, CT13 and CT16 uniform-image assertions, CT12, Nori A/B, Jantzen/Larsen95b, Larsen–Pink92/95 and Milne–Ramachandran. Larsen2010 is now fully read: close its Nori correspondence, Serre analytic-growth, finite extension/Jordan component, Kneser ramified splitting, EGA reduced-family/Hilbert properness/component-constructibility and Lang/finite-field point-count inputs. Review and repair E5 before exporting Lemma4.
- **G2**: Turn item116's CRT weight-projector argument into a fully typed lattice/subquotient proof; combine the finitely many degrees and ranks, fibre powers, shifts and geometrically trivial determinant twists to obtain a single bound independent of the subquotient.
- **G3**: The generic degree-one coefficient arguments are now supplied in147–155: canonical/explicit algebraic comparison, continuous sections, invariant reduction, rationalization kernel and compact localization, finite-tower H1 comparison, and conditional quotient surjectivity. Remaining source closure is the precise affine-curve cdℓ≤1, finite-coefficient H1 finiteness and group/étale-sheaf H1 comparison needed to discharge155 for item48. Typed implementations and the canonical naturality checks remain downstream R02.1 work, not asserted library theorems. In particular transport the geometric H2 vanishing to the explicit discrete H2 carrier of156 through the upstream discrete comparison before applying155.
- **G4**: Check Bruhat–Tits big-cell hypotheses over ramified splitting O_E, affine-model hypotheses in Lemma8.1, schematic closure under base change, special Lie base change and simply connected isogeny extension. Review E3 before any small-prime export.
- **G5**: The CT16 author-version lemma4.2.1.1 is read, and determinant-line fixing, antisymmetrization and conversion to separate tensor bounds are decomposed in120–127. Establish the exact finite-type exponential-family and Chevalley/spreading statement122 over all coefficient algebras. The selected two-pass product and Larsen’s 2r²-pass construction have different parameter counts; do not identify them or infer scheme equality from finite field points. Verify Borel/EGA originals and NoriA for the alternate Lie-tuple family.
- **G6**: Read Larsen–Pink Γ-regular and common-Frobenius statements directly, prove the arithmetic torus lift and discriminant exclusion, and justify uniformity of the single chosen closed point across coefficients.
- **G7**: Resolve the precise rational-coefficient ℓ quantification and finite-extension stability in Corollary11.1/MR04 Lemma3.1, with both complementary Tate assumptions and integral cycle saturation.
- **G8**: Reconcile any overlapping future generic Lang/Tits/finite Lie-type simplicity or exterior-adjoint invariant owner at design time. CFSGStatement L3 is a carrier roadmap and explicitly does not prove simplicity. Library nonexistence claims are scoped to this pinned search, not all future work.
- **G9**: Future blueprint work expands the suggested files into signatures, API and tests and compiles at the pins. This is downstream formalization work, not an unfulfilled authorized paper deliverable; no Lean file was requested here.

Only the two named paper deliverables and this handoff are authorized. Maintain partial status until recursive source gaps are resolved. Independent review supplies source-finding verdicts.
