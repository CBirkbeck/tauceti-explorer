# DESIGN-MotivicStructuresInModuliOfCurves

Agent: Codex. Session: codex-o0QXo2. Issue: #3453. Date: 2026-10-19.
The claim was confirmed by the bot at issue comment 6262018731.

This is a completed design pass for independent review, not a checkpoint or an implementation. The five deliverables are the roadmap definition, blueprint packet, reader, suggested Lean file and this handoff. Every stage TC.0–TC.12 is **planned**, none is closed, and every node has implementation status unchecked. The packet has 103 nodes: 10 definitions, 7 constructions and 86 theorems; 64 API items; 51 definition/construction checks; 50 planets; and 7 cited baseline declarations. Its item coverage accounts for all 86 CLP and 48 BFP items routed here, including conjectures and the announced graph-presentation result without treating them as proved hypotheses.

## What is complete

The reader specifies every target, coefficients, stability hypotheses, dimension and Tate conventions, internal dependencies, exact supplier contracts, proof outlines and source locators. Definitions and constructions have their APIs, consumer uses and at least three discriminating checks. Genus-one and genus-two cohomology, the marking quotient, finite STE generation, Chow–Künneth generation, tetragonal geometry, the corrected Mukai gates, the genus-four sieve and equivariant counts, exceptional cusp graphs and final realization classification all have target-level plans.

The stable-pair dependency order was checked for cycles and for dependencies on a higher layer. In particular, the genus-two even calculation follows the marking quotient in TC.3; its Galois odd calculation follows the low-degree inputs in TC.11. The genus-two degree-fifteen endpoint in TC.12 asserts cusp generation of complementary cohomology H^(2d−15), followed by a degree-fifteen realization classification through duality. It does not assert the cohomological generation conjecture.

The reviewed library-coverage audit was screened before planning. Current Tau Ceti and the current upstream roadmaps were checked in addition to the pinned baseline and atlas snapshot. The full current AlgebraicVectorBundles and HodgeStructures readers, their suggested files, and the relevant SchurWeyl, OrthogonalSpinGroups and SpinRepresentations material were read. Existing finite locally free algebra, abstract Hodge structures, half-spin representations, representation rings and fixed-degree symmetric functions are imported. No existing library theorem or upstream roadmap target is re-planned. Projective/Grassmann bundle inputs use the actual R09.1 nodes; the AlgebraicVectorBundles roadmap does not promise them. No changes were made to upstream material or other jobs' packets.

## Remaining obligations

The packet records 15 gaps with exact direct consumers and transitive stage remaining lists. Fourteen concern proof dependencies; the final one records a source announcement with no planned target consumer.

1. **G-stack-duality:** rational Betti/etale Verdier and Poincare duality, compact supports, Kunneth and boundary functoriality for the actual DM stacks. The routed stacks Part II has no established exact node contract supplying this.
2. **G-stack-comparisons:** geometric mixed Hodge structures, Betti/etale comparison and the all-Z stack trace and p-adic hypotheses needed for actual Tate splitting. Frobenius eigenvalues alone establish less.
3. **G-stack-cycle:** the requested SF.5 and MC.2 stack-general exterior products, Gysin, nonrepresentable rational pushforward, nodal-family GRR and realization compatibility. Their existing scheme statements are insufficient.
4. **G-projectivity-lefschetz:** all-pointed projectivity, a rational tautological ample class, and stack hard Lefschetz. Existing proper coarse-space and smooth-projective-scheme Lefschetz statements do not give the full contract.
5. **G-mapping-class-inputs:** primary Harer dimension/stability and top-degree vanishing proofs, with the Teichmuller/stack comparison.
6. **G-source-inputs:** primary Keel, Arbarello–Cornalba, Getzler, Petersen and earlier CLP inputs underlying genus-zero/one computations and H11 generation. The present papers were read; these earlier primary proofs were not.
7. **G-genus-two-inputs:** primary compact-type direct-image and local-system cohomology results, including weights, twists and involution parity.
8. **G-local-system-descent:** monodromy torsors, geometric local systems, relative Kunneth/Leray and harmonic contractions with transposed Specht action. The Brauer representation algebra does not construct these maps.
9. **G-known-chow:** primary low-genus CKgP/tautological Chow, low-gonality and marked Hurwitz results, including splitting-stratum support classes. Distinguish PGL2 target families from an SL2 lift carrying O(1); prove the required central descent and rational Chow transfer.
10. **G-orthogonal:** a valid relative orthogonal Grassmannian Chow/CKgP theorem for the actual universal iterates. A trivial underlying vector bundle is not automatically a split quadratic bundle, and the parabolic exact sequence need not split equivariantly.
11. **G-mukai:** the explicit lift and descent targets TC.6/mukai-lift-gate and mukai-descent-gate: family comparison, actual stabilizers, central characters/cancelling lines, and rational transfers natural after every test-stack product. Merely replacing SO10 by Spin10 does not prove these.
12. **G-finite-field-geometry:** primary change-of-variables and characteristic-two hyperelliptic counts, canonical complete-intersection geometry, and all-characteristic quadric classification/stabilizers. GN.2's arithmetic scope was checked and does not supply this classification.
13. **G-symmetric-functions:** the completed lambda-ring, Adams operations, plethystic Exp/Log, continuous ordinary exp(Delta) and finiteness. Current SchurWeyl Layer 7 is fixed-degree; scalar formal series are insufficient.
14. **G-computations:** independently reproducible boundary/equivariant coefficients, the Gorsky genus-four Euler expansion, multiplicities 429/6006/186263/264/836, and the full 891-graph matrix, rank-825 pivots, 66 kernel vectors and nonzero pairing. The checks below establish transcription consistency, not these missing certificates.
15. **G-graph-presentations:** CLP Remark 7.8 announces a complete graph presentation without proving it. This is source coverage only and does not block a planned endpoint. The alternative self-pairing certificate in Remark 7.9 belongs to G-computations.

There are four explicit stage requests: SF.5's stack intersection extension, MC.2's stack realization extension, and import contracts for current SchurWeyl Layers 7 and 9. The packet's restructuring proposals assign generic extensions to their existing directions as Part II: stacks duality, completed symmetric functions, stack intersection/realization/Lefschetz/projectivity, and finite-field quadratic geometry. No new prospective stage identifier is used as if established. Nothing is moved from a higher-tier roadmap into an overlapping independent theory here.

## Source findings for independent review

Twelve source findings are recorded with the versions read, locators, corrections, reasons and bounded correction searches. Existing extraction findings are credited. The main additional finding is **E4**, against CLP Lemma 2.1, pp.4–5: its printed smaller-degree condition does not cover same-degree forgetting. The proposed counterexample is the tautological STE at (g,n,k)=(1,12,11): the current pure quotient by forgotten-marking pullbacks is zero and the required degrees at most nine are tautological, while the odd tautological group is zero and H11 has dimension 22. The reader states a strengthened sufficient criterion including smaller-pair degrees through k, and explains the induction repair. Review that counterexample, its dimension restrictions and the repaired induction first.

Also independently review **E5**, the quadratic-form trivialization step in CLP Lemma 5.10, p.19, and **E6**, the asserted equivariant direct sum in §5.3.1, p.18 before Lemma 5.8. The latter can use the parabolic exact sequence for the needed Chern identity. The source's SO10 half-spin problem is preserved as a substantive Mukai proof gate, and the 66-symbol representation uses S10×S2 rather than S10. The BFP boundary weight complex retains determinant-of-edge orientations; it is distinguished from ordinary open-stratum graph assembly. The corrected open three-mark coefficient is −11q^3.

The bounded web searches found publisher, author and arXiv copies but no independent correction. This is neither an exhaustive novelty claim nor an independent confirmation. No source passage was copied into the deliverables.

## Reading record

- Canning–Larson–Payne, *Extensions of tautological rings and motivic structures in the cohomology of moduli spaces of stable curves*, Forum of Mathematics, Pi 12 (2024), e23, published author copy, entire pp.1–31, including the figures on pp.25–27.
- Bergström–Faber–Payne, *Polynomial point counts and odd cohomology vanishing on moduli spaces of stable curves*, Annals of Mathematics 199 (2024), entire published author copy, pp.1323–1365, including ordinary and marking-twisted sieve tables.
- Getzler–Kapranov, *Modular operads*, Compositio Mathematica 110 (1998), §8.1–8.13, pp.107–111.
- Gorsky, *The equivariant Euler characteristic of moduli spaces of curves*, arXiv:0906.0841v3, entire pp.1–7. The published-file endpoint returned an empty response. Published collation and the required genus-four expansion remain in G-computations.

The packet and reader contain public URLs, access dates, versions and SHA-256 hashes. Earlier primary sources not read are enumerated in the gaps above; they have not been promoted to baseline citations. The cleared library index was checked; no restricted book was used or copied.

## Validation and resume point

- `python3 scripts/check_blueprint.py research/blueprint/packets/MotivicStructuresInModuliOfCurves.json`: 0 errors, 0 warnings.
- `lean-check` on the suggested file: exit 0 at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Its 148 lines contain seven real-bodied numerical/polynomial definitions and 38 theorem/example placeholders; the only warnings were for those placeholders. This checks elaboration, not proofs. Geometric carriers absent at the pins remain fully specified README targets.
- Exact arithmetic checks passed for all closed-minus-boundary/open polynomials; compact palindromicity and positivity; dimension specialization of the S2 and S3 tables; open Euler value −10 and Schur specialization 2s3−6s21; graph-family cardinalities and rank arithmetic; item-coverage uniqueness; API/check coverage; and reader/packet target alignment.
- The sourceIssues/sourceVersions objects passed `scripts/check_errata.py` through a scratch errata-v1 wrapper, without changing the packet's blueprint-v1 protocol.
- The five deliverables are checked with `research/blueprint/intake.py check-files` before submission; no PDFs, source extracts, private paths or helper scripts are submitted.

The next action is independent review of this completed design. Close the exact source/supplier/descent/certificate obligations above before certifying any affected stage closed. The worklist and source downloads are disposable scratch; this handoff, the packet and the reader preserve every unresolved obligation.
