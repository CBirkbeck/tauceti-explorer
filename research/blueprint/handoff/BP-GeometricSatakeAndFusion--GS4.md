# BP-GeometricSatakeAndFusion--GS4

Codex, session `codex-DiO7NT`, issue #10916. Claim confirmed by the swarm bot
on 19 October 2026. This is the complete target-level planning pass under
PROTOCOL §0, ready for independent review. All four stages are **planned**;
none is dependency-closed. No implementation is claimed.

The deliverables are [packet](../packets/GeometricSatakeAndFusion--GS4.json),
[reader](../readmes/GeometricSatakeAndFusion--GS4.md) and
[suggested signatures](../suggested/GeometricSatakeAndFusion--GS4.lean).

## Ownership and inventory

The accepted GS3 packet already owns 24 GS4 targets. This submission imports
all 24 stable identifiers, records their target ledger, and states their full
contracts, 28 API items and 15 definition/construction checks in the reader.
It neither changes the GS3 packet nor republishes its nodes. Where a proof is
refined, the reader uses the companion argument instead of repeating the old
proof's obsolete obligation. In particular the integral-model statement no
longer needs a theorem about arbitrary invariant lattices.

The new packet has 17 companion nodes: 4 theorems, 10 comparisons,
1 construction and 2 definitions. It contains 20 API items, 19 unit-test
contracts, 14 checked baseline declarations, 5 gaps and 14 supplier records.
Seven supplier records import existing upstream plans; seven request precise
stronger interfaces. The reader therefore covers 41 distinct nodes, 48 API
items and 34 checks. Retain the existing ten planets and add only **Twisted
Frobenius character**: six integral, two rational and three classical planets.

The new proof adapters provide the bounded standard filtration and coefficient
lifting, F-split coequalizer preservation/reflection, algebraic adic assembly
from finite pieces, geometric rational recognition, the minuscule top-cycle
invariant calculation, the conditional characteristic-two image test, integral
model recovery and flat-module saturation, pinning descent, lifted-cocycle
normalization, Levi/field transport, perfect kernels, and the Frobenius trace
square. These are mathematical plans with the exact supplier obligations below,
not claims that their carriers or proofs exist in Lean.

## Confirmed red-team findings

- **RT-AREA-geomlanglands/16, Prasad–Yu:** the read-only current upstream
  ReductiveGroupsPartII §RG2.3.1 already plans the general extension principle
  and closed-immersion criterion. Import its README theorem with the
  characteristic-two/no-normal-odd-orthogonal exception. Its compact Suggested
  statement covers only residue characteristic different from two; do not
  extrapolate that signature. GS4 first treats the dual of G_ad, with simply
  connected derived group, then recovers the central/component grading. The
  actual Satake lattice and RG2.4 point generators suffice. No duplicate
  Prasad–Yu or lattice-existence node is introduced.
- **RT-AREA-geomlanglands/17, reconstruction duplication:** import MC.6's
  relative finite-piece/coalgebra/bialgebra/antipode chain and its finite-type
  and connectedness recognition. The GS4 adapter verifies the Satake-specific
  split-coequalizer hypotheses, including preservation and reflection.
  Characteristic-zero reductivity comes from existing ReductiveGroups Layer6.
  The general MC.6 theorem is independent of its motivic applications; no
  motivic cycle or period prerequisite is imported. Supplier plans remain
  plans, including their separately recorded revision obligations.
- **RT-AREA-geomlanglands/19, perfect extension:** GS4 owns the enhanced
  Satake-kernel application; HS1 imports it. LP3/LP4 own highest-weight theory,
  relative classifying-stack base change and derived exact-representation
  completion. The all-prime statement and VS2 coefficient/coherence adapter
  remain GS4-G3. Neither a good-prime parameter-stack theorem nor averaging
  over the finite component group supplies this input. Do not duplicate the
  representation-theoretic foundations in PotentialAutomorphyInfrastructure.

## Precise follow-up work

1. **GS4-G1, characteristic two:** LP3 must supply the displayed SL₂ tilting
   factorization, Steinberg-kernel invariant line, good-filtration invariant
   counts and tensor/direct-summand facts. GS2 must expose smooth proper
   semismall iterated minuscule convolution geometry with finite models.
   GS4 derives the modular Hom-to-top-Borel–Moore formula from EDC duality;
   it does not request a modular decomposition theorem or assume that Hom
   formula from GS2. The counterexample N(T) and its Frobenius preimages are
   excluded by the strengthened tensor-invariant test, not by highest weights
   alone.
2. **GS4-G2, normalization:** VS1 must identify Drinfeld-transported root-line
   action with stalk Frobenius and the FS IX.7.1 parameter convention. The
   cocycle multiplication formula is already checked algebraically. The
   geometric-Frobenius half-Tate stalk scalar r⁻¹ and the positive parameter
   exponent must be reconciled by an explicit action/Borel dictionary; they
   are not asserted equal. This obligation also controls the pinned trace
   square.
3. **GS4-G3, perfect complexes:** LP3/LP4 must give the stated relative
   Perf(BQ)-linear base change and derived stable idempotent completion of the
   exact finite-projective representation category for every ℓ≠p, including
   ℓ dividing the component-group order. VS2 must give relative duality,
   enhanced convolution and π♮ coherence after the stated coefficient
   extensions. Existing restricted parameter-stack and completed-coefficient
   statements have narrower scopes. No enhanced essential-image equivalence
   or full faithfulness is claimed.
4. **GS4-G4, finite-field trace:** GS0 and SF.2 must provide the specified
   Frobenius-equivariant bounded Witt models and proper/compact-support trace
   exchange, including nonsplit constant-term diagrams. A bare perfection
   equivalence, or compatibility with only an unspecified Frobenius power,
   does not suffice. SF.2 already routes point counting to its assigned
   supplier; do not create a new general trace-formula owner. The currently
   absent upstream CohomologicalPointCounting folder was not treated as an
   inspected baseline module.
5. **GS4-G5, Zhu continuation:** the imported FS comparison has an algebraic
   closure of a finite field as Witt base and the tensor structure transported
   from fusion. The accepted GeometricSatakeAndFusionPartII design routes the
   29 independent rational Gelfand-proof items to the separate
   GeometricSatakeAndFusionPartIIRationalGelfandProof brief. That brief has no
   completed proof nodes. Its owner must handle arbitrary algebraically
   closed base fields and Zhu's own tensor constraint, or provide the exact
   comparison. This is independent of the FS integral theorem.

Coverage is planned for GS4, integral-dual-group, rational-reductivity and
classical-Satake-comparison. Their individual `remaining` lists specify which
of these five obligations they consume. The rational FS recognition itself has
no new mathematical gap; its larger Zhu variant retains GS4-G5. Classical
comparison stays strictly downstream of reconstruction, normalization and SR4.

## Existing suppliers and structure

Current upstream ReductiveGroupsPartII §RG2.3, §RG2.4, §RG2.5 and §RG2.0a supply
extension/Prasad–Yu, integral point generation, dual data and Weil restriction.
Existing ReductiveGroups Layer6 and ClassFieldTheory Layer9 supply reductivity
recognition and the Weil group. Current SmoothRepresentationsOfLocalGroups
SR4.1 already supplies the normalized spherical transform, torus-character
dictionary and Frobenius-component invariant algebra. These seven imports are
not new upstream mathematical requests. Stronger requests concern LP3, LP4,
VS1, VS2, SF.2, GS0:Witt-geometry and GS2:correspondences.

Preserve the previously proposed early reconstruction sublayer and stable node
identifiers. The relative reconstruction theorem remains owned by MC.6.
The accepted rational Gelfand continuation brief is reused rather than designed
again. All other GS0–GS3 geometry, fusion and EDC decomposition inputs retain
their existing owners. No higher-tier theorem is used to construct its own
prerequisite.

The current upstream audit read TauCetiRoadmap commit
`0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including the nine roadmaps newer
than the atlas snapshot. The pinned declaration audit remains Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. No upstream files were changed.

## Sources and corrections

The packet records editions, URLs, read sections and public-file hashes.
Read FS VI.7, VI.9–VI.12, relevant IV.7 and IX.2/IX.6/IX.7; Zhu's published
§§2.1–2.2 and §2.5; Deligne–Milne §2; Prasad–Yu Corollary1.3 and §5.4;
Doty–Henke Lemmas1.1/1.4 and the Steinberg-square example; Gross §§3–4;
ZhuIntro arXivv2 §§5.5–5.6; and the published Richarz–Zhu appendix pp444–449,
compared with its arXivv3 appendix. The cleared Jantzen second edition was read
in place at II.3.16–3.19, II.4.16–4.21 and II.E.1–E.7; no file or passage was
copied. Source statements are restated in our own words. No required source
was inaccessible. The typeset Park City version of ZhuIntro was not collated;
the citation explicitly identifies the preprint that was read.

Earlier E25–E35 remain GS3 findings and are referenced without duplicate records.
New E36 corrects the published RZ A.8 semidirect-product formula by multiplication
with a lifted cocycle, citing ZhuIntro Lemma5.5.7 as a prior correction. New E37
records the finite-image versus semisimple pure-weight-zero distinction in
RZ A.9/A.12. The trivial-group counterexample is the continuous rank-one
3-adic character with eigenvalue (3+4i)/5; it is pure of weight zero but has
infinite image. The bounded correction searches and exact version locators are
in the packet. The classical comparison uses explicit Frobenius operators and
therefore does not rely on the erroneous categorical identification.

## Verification and Lean boundary

- The pinned-baseline blueprint checker reports **0 errors, 1 warning**. Its
  index omits the additive declaration `Even` generated from `IsSquare` and
  suggests unrelated qualified names. The actual pinned definition and its
  variables were read; integer `Even` elaborates in the suggested file. This
  is an explained index warning, not an unresolved mathematical gap.
- Source-issue schema and source-version checks report **0 errors**.
- Swarm intake file validation reports **4 files, 0 problems**; only the three
  assigned deliverables and this handoff are included.
- Reader/packet checks account for all 24 imported and 17 companion IDs and
  every definition/construction API item and test. All implementation statuses
  remain unchecked. The suggested file passes the no-placeholder-data check.
- The 174-line suggested file was elaborated with `lean-check` at the pinned
  shared build: exit 0, **14 proof-placeholder warnings only**, no other
  warnings or errors. Four small examples are proved. Only three scalar
  definitions have real bodies; there are no substitute geometric categories,
  axiom carriers or placeholder data definitions. Heavy targets and their
  complete APIs/tests stay in the reader under the current shape rule.

The remaining mathematical work is exactly GS4-G1–G5 above. Independent review
should check the characteristic-two conditional repair, normalization
orientation, all-prime perfect-completion hypotheses and the finite-model trace
handoff particularly carefully. This note contains the information needed to
continue; no scratch file is an input to the deliverable.
