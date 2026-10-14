# Handoff: BP-GL2AutomorphicRepresentationsAndTransfer--R17.4

Claude (session `claude-aUA4oH`), 14 October 2026. Refs
[#9413](https://github.com/CBirkbeck/tauceti-explorer/issues/9413). Branch `claude-aUA4oH-bp-9413`.

## What was done

Deliverables:
[packet](../packets/GL2AutomorphicRepresentationsAndTransfer--R17.4.json),
[reader](../readmes/GL2AutomorphicRepresentationsAndTransfer--R17.4.md),
[suggested Lean file](../suggested/GL2AutomorphicRepresentationsAndTransfer--R17.4.lean).

The issue says to start from the coverage record of R17.4 in the R16.1 packet, but that packet does not cover
R17.4. The R17.3 packet does: it plans R17.4 at target level with fifteen nodes and six planets, and its
coverage record lists what remains. This packet starts from that record. It cites the fifteen nodes without
repeating them and adds twelve new ones (3 definitions, 9 theorems), with 26 API items and 15 unit tests. It
adds no planets, because the layer already shows six.

- **Local base change for any finite extension**, by restricting the rank-two parameter
  (`R17.4/local-base-change`). Also the GL₂ local converse theorem (`gl2-local-converse`, BH 27.1) and
  Langlands' λ-constants with the global product formula ∏_v λ_v² = κ_{K/F}(−1) = 1
  (`lambda-square-product`, BH 30.4).
- **The cubic local lift.** Local GL₃ induction from a cubic étale algebra (`local-cubic-induction`). The
  twisted factors of the lift are the GL₂ × GL₃ pair factors up to λ⁻² (`local-cubic-factor-identity`), so the
  Jacquet–Piatetski-Shapiro–Shalika factor-defined lift corresponds to restriction for every type. The explicit
  lifts of principal series, special and dihedral representations are written out
  (`local-cubic-explicit-lifts`); these are the cases Carayol asserts without reference.
- **Non-normal cubic base change at every place.** GL₃ induction from a non-normal cubic field
  (`nonnormal-cubic-gl3-induction`, JPSS 1979 Theorem 14.2 and its monomial remark) gives the twisted
  L-functions of the tensor product of local lifts (`nonnormal-cubic-twisted-l-functions`). With the GL₂
  converse theorem over K (R16.5) these give the all-place theorem (`nonnormal-cubic-strong-base-change`). The
  K-exceptional case (twists of the S₃ dihedral representation) is computed through quadratic base change to
  the resolvent field, and the cuspidality criterion follows (`nonnormal-cubic-cuspidality`). Neither Artin
  automorphy (R17.5) nor Carayol's globalisation is used, so dyadic extraordinary places need no separate
  argument.
- **Exports for consumers.** Local invariants (`local-base-change-invariants`): conductors along unramified
  extensions, tame principal series becoming unramified, Steinberg root numbers under quadratic base change
  (Skinner's table) and archimedean weights. The Frobenius splitting rule for Satake powers
  (`cubic-splitting-satake`) is typed on Tau Ceti's `Equiv.Perm.fullCycleType`.

Checks: `python3 scripts/check_blueprint.py` (with the declaration index) reports 0 errors and 0 warnings. The
reader is rendered from the packet and was grepped for "optional", "deferred", "later" and "sorry". Every
packet declaration, API and test name occurs in the Lean file.

**Lean.** The suggested file elaborates with `lean-check` at the pins (Mathlib 082e2d3, Tau Ceti f790474).
Its only warnings are the twelve `sorry`s. It imports `TauCeti.GroupTheory.Perm.Partition` and types
`cubicBaseChangeSatake` with seven API lemmas and five test examples. In a scratch copy I proved the
identity, transposition, 3-cycle, conjugation, card and determinant lemmas, so those statements are true. The
other eleven nodes need carriers absent at the pins; they are listed in the closing "Statements not typed at
the pins" block, grouped by carrier.

## Red-team findings handed to this job

- **RT-AREA-automorphic-1/1** (GL(3) inputs of non-normal cubic base change and Langlands–Tunnell).
  - The R17.3 packet planned the adjoint lift, cyclic cubic induction, GL₃ recognition and a weak transfer.
    This packet plans the non-normal cubic transfer completely: its GL₃ input is `nonnormal-cubic-gl3-induction`
    (JPSS 14.2 through AL.3/gln-converse-reduced-rank), and the GL₂ × GL₃ Rankin–Selberg theory is AL.3.
  - The GL_n converse theorem stays planned once, in AL.3.
  - The new nodes are added to the proposed R17.4a sub-layer (restructure entry 1).
- **RT-AREA-langlands-2/4** (R17.4 must plan the non-Galois cubic lift with local compatibility for R19.2).
  - Planned by `local-base-change`, `local-cubic-factor-identity`, `local-cubic-explicit-lifts` and
    `nonnormal-cubic-strong-base-change`.
  - The extraordinary dyadic comparison (Carayol 12.2.2), which the accepted fix left at R19.2 because
    Carayol's proof uses Artin automorphy, now follows locally here. Restructure entry 2 makes R17.4 its owner
    and AutomorphicGaloisRepresentations:R19.2/carayol-cubic-base-change-of-extraordinary a citation; the
    maintainer decides.

## What remains

The coverage record of R17.4 is `planned`; its `remaining` list holds four items:

1. **ET.6 has no packet.** The GL₃ LLC with GL₁-twist and GL₂ × GL₃ pair compatibility is requested from it.
2. **The non-normal cubic proof is this packet's own assembly.** That is the single gap. JPSS's 1981 CRAS note
   is not free, and Mao–Rallis (CJM 2000) is paywalled. Carayol §12.2.1 and Cogdell's survey confirm the
   statement and the converse-theorem method. A reviewer should check the route in
   `nonnormal-cubic-twisted-l-functions` and `nonnormal-cubic-strong-base-change`: case (b) through the
   resolvent and the λ² product, and the central-character argument of the exceptional case.
3. **Inherited from the R17.3 nodes, unchanged here:**
   - the highly ramified T-twist GL₃ converse variant needed by the adjoint lift;
   - the adjoint lift's MetaplecticAutomorphicForms MP.5 input — that roadmap is outside the Caraiani–Newton
     order, so at package time it must be moved down or stated as a named input;
   - the omitted signature of `gl3_recognition`.
4. **Below target level:** the decomposition of the prime-cyclic transfer, which waits for R17.2 and ET.4.

## Requests and consumer map

There are ten requests: ET.6; Tau Ceti ClassFieldTheory Layers 8, 9 and 11; GlobalNumberFields Layers 8 and 9;
InductionRestriction Layer 3; NumberFieldArithmetic Layer 5; LocalFieldsRamification Layers 2 and 3. Every
other prerequisite is a node of an accepted packet in a lower tier: R16.x, R17.2, AL.1–AL.4, AF.1–AF.3,
R01.2–R01.3. No notion was moved down and no higher-tier roadmap is cited.

Requests to R17.4 found in other packets, and where they are answered (`interfaceExports` in the packet):

- **AutomorphicGaloisRepresentations (R19.2–R19.5).** Answered by the new cubic nodes, plus the R17.3 packet's
  cyclic nodes and adjoint lift.
- **GL2ModularityLifting R22.1/R32.3, PotentialModularity R23.1/R24.3, OrdinaryAutomorphic R21.4,
  SmallRamification R25.5, EllipticCurveModularityImaginaryQuadratic IQ.1, EllipticCurveModularityPartII GT.6,
  BCGP21 items 154/162, Newton–Thorne, Caraiani–Newton.**
  - The automorphic half (cyclic/solvable base change and descent, local components, fibres) is the R17.3
    packet's nodes, plus `local-base-change-invariants` for weights, conductors and tame ramification.
  - The Galois-side statement "ρ automorphic iff ρ|G_E automorphic" (Gee 4.25, BLGHT 1.3, BLGGT 2.2.2) needs
    attached Galois representations (R19, downstream). Its planned owner is
    PotentialAutomorphyInfrastructurePartII:PL.0/soluble-descent, so it is not an R17.4 target.
- **Skinner 2020 §2.1 (PAPER-SKINNER-20/14).** Root numbers in `local-base-change-invariants` (c).
- **Ichino–Prasanna item 100** (conjugate-orthogonality of quadratic base change). Not an R17.4 target; it
  concerns Asai/unitary theory. I note it only.

Restructure entry 3 asks the next revision of the R17.3 packet to replace its bare-stage prerequisites (R17.2,
R16.3, R16.4, R16.5) by the accepted R16.1-packet nodes listed there. It also suggests moving
`gl2-local-converse` to R16.3 when that stage is revised.

## Sources

| Source | Version and hash | Sections read (and where to get it) |
|---|---|---|
| Bushnell–Henniart 2006 | atlas-library copy, sha256 f0f1f094…; book page = PDF − 6 | §26.1, §27.1–27.8, §30.4, §33.4, §34.1 |
| JPSS, *Automorphic forms on GL(3) II* | Jacquet's Columbia scan, sha256 0cf1baf4…; no text layer, read from page images | Theorem 14.2 and the monomial remark, pp. 253–255 |
| Carayol 1986 | Numdam, sha256 d4a5fb6b… | §12.2–12.3, pp. 457–459 |
| Cogdell, *Piatetski-Shapiro's work on converse theorems* | sha256 0c922b6e… | p. 10 |
| Milne, ANT v3.08 | sha256 24b83c78… | Thm 3.41, Prop 8.21, Cor 8.22, Thm 8.23 |

Not read:

- JPSS, *Relèvement cubique non normal* (CRAS 1981): not freely available.
- Mao–Rallis, *Cubic base change for GL(2)* (CJM 2000): paywalled.
- Tunnell's Bull. AMS 1981 announcement: AMS refused the download. It is cited only through the R17.3 node.
- Clozel–Rajan arXiv:1806.02513 (image and fibres of solvable base change): fetched but not used; it covers
  Galois extensions only.
