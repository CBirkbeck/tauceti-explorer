# Handoff — PAPER-CADORET-HUI-TAMAGAWA-17

Codex — codex-c83e7a. Refs #1157. Continues codex-a71f92/PR1937. Status: partial; no formalization claimed.

## Saved result

-142 items:7 library,8 planned,127 missing;119 prior IDs retained. All missing items routed exactly once in the same seven routes.
-41 definitions/constructions now have82 statement-level API entries, uses and123 proposed tests. No implementation tests are claimed for these APIs.
-Full official CHT reread; full Larsen2010 read; CT16 author pp.10–12 read, tensor lemma is4.2.1.1 on p.11 in this version, corresponding to CHT's citation Lemma4.1. Exact URLs/hashes/read scope in JSON.
-120–127 decompose uniform tensor separation;128–141 decompose Larsen's proof;142 supplies the final closed-subscheme equality. The graph has177 internal edges and is acyclic.
-E1–E4 preserved unchanged; E5 records the printed empty-boundary/image-family confusion in Larsen Lemma4. All five findings unreviewed.
-G1/G5 narrowed but not closed. The report contains both new and prior runnable exact diagnostics, all passed; paper checker and intake results in JSON. No Lean file requested or compiled.

## Resume in depth

1. Verify item122 against the original Borel Chevalley/bounded-product and EGA spreading references. Pin the scheme-level parameter family; CT16's selected two-pass tuple is not Larsen's2r²-pass tuple. Fixed finite-field points cannot substitute for subgroup-scheme equality.
2. Review E5 and complete131 with a correctly typed closed-image family, geometric reducedness and specialization/base-change. The printed W_U is empty on the chosen open. Then close130/139's Hilbert/flatness/component inputs.
3. Read primary NoriA/B and Serre1981 Theorem8 for129/135. Retain closedness in136, the finite central extension in137, the unipotent-radical assumption and unchanged residue field in138/141.
4. Continue the independent nice-torus, compact-cohomology and arithmetic Tate branches. Do not infer arithmetic semisimplicity from the geometric theorem or hyperspeciality of the image from almost hyperspeciality.

- G1: Verify recursive originals for Gabber/Suh, CT13 and CT16 uniform-image assertions, CT12, Nori A/B, Jantzen/Larsen95b, Larsen–Pink92/95 and Milne–Ramachandran. Larsen2010 is now fully read: close its Nori correspondence, Serre analytic-growth, finite extension/Jordan component, Kneser ramified splitting, EGA reduced-family/Hilbert properness/component-constructibility and Lang/finite-field point-count inputs. Review and repair E5 before exporting Lemma4.
- G2: Turn item116's CRT weight-projector argument into a fully typed lattice/subquotient proof; combine the finitely many degrees and ranks, fibre powers, shifts and geometrically trivial determinant twists to obtain a single bound independent of the subquotient.
- G3: Establish canonical versus explicit continuous H¹ comparison for compact coefficients, continuous splittings, the exact reduction/rationalization sequences and affine-curve cd≤1 on the correct coefficient carrier.
- G4: Check Bruhat–Tits big-cell hypotheses over ramified splitting O_E, affine-model hypotheses in Lemma8.1, schematic closure under base change, special Lie base change and simply connected isogeny extension. Review E3 before any small-prime export.
- G5: The CT16 author-version lemma4.2.1.1 is read, and determinant-line fixing, antisymmetrization and conversion to separate tensor bounds are decomposed in120–127. Establish the exact finite-type exponential-family and Chevalley/spreading statement122 over all coefficient algebras. The selected two-pass product and Larsen’s 2r²-pass construction have different parameter counts; do not identify them or infer scheme equality from finite field points. Verify Borel/EGA originals and NoriA for the alternate Lie-tuple family.
- G6: Read Larsen–Pink Γ-regular and common-Frobenius statements directly, prove the arithmetic torus lift and discriminant exclusion, and justify uniformity of the single chosen closed point across coefficients.
- G7: Resolve the precise rational-coefficient ℓ quantification and finite-extension stability in Corollary11.1/MR04 Lemma3.1, with both complementary Tate assumptions and integral cycle saturation.
- G8: Reconcile any overlapping future generic Lang/Tits/finite Lie-type simplicity or exterior-adjoint invariant owner at design time. CFSGStatement L3 is a carrier roadmap and explicitly does not prove simplicity. Library nonexistence claims are scoped to this pinned search, not all future work.
- G9: Future blueprint work expands the suggested files into signatures, API and tests and compiles at the pins. This is downstream formalization work, not an unfulfilled authorized paper deliverable; no Lean file was requested here.

Only the two named paper deliverables and this handoff are authorized. Maintain partial status until recursive gaps are resolved; independent review, not this worker, supplies source-finding verdicts.
