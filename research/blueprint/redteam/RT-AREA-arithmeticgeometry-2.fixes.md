# RT-AREA-arithmeticgeometry-2: fixes

Fixer: Claude Code, session `cc-e94dc5`, 29 September 2026 (issue #3962).
- Findings: `RT-AREA-arithmeticgeometry-2.result.json`.
- Verdicts: `RT-AREA-arithmeticgeometry-2.review.json`.
- Two findings, both confirmed as missing ownership contracts. The review corrects each proposed fix, and the corrected contracts are followed here.

Both fixes are stage contracts in the campaign roadmap document `content/campaign/InverseGaloisAndArithmeticFundamentalGroups/README.md` (mirrored in `data/atlas.json`). That document is maintained outside the job intake. As in the other area fixes, this report is the only file changed, and each section gives the **exact edit for the maintainer** at origin/main. Everything cited was checked.

## /1 (medium, missing): the pro-étale fundamental group has no owner

### What was checked

- **IG.0** (README lines 18–25) constructs "the profinite automorphism group of the geometric fibre functor on finite étale covers, together with its equivalence to finite continuous sets". That is the SGA1 group.
- **The consumer.** Accepted item PAPER-CARAIANI-SCHOLZE-17/125, "The pro-étale fundamental group and J_b(Q_p)-torsors on S_proét (Bhatt–Scholze)" (Proposition 1.13 and Remark 1.14, pp. 656–657; Remark 4.3.14, p. 721), is routed by route 13 to IG.0, which "widens it". IG.0 does not construct that group, and no other stage names it.
- **Mathlib at the pin** (`082e2d3`, `Mathlib/AlgebraicGeometry/Sites/Proetale.lean`) has the site:
  - `AlgebraicGeometry.Scheme.proetaleTopology` (line 66);
  - `AlgebraicGeometry.Scheme.ProEt`, the category of weakly étale S-schemes (line 100);
  - `AlgebraicGeometry.Scheme.ProEt.topology` (line 151).

  It has no pro-étale fundamental group.
- **The review's corrections**, from Bhatt–Scholze (Definition 7.1.1 and its footnote, Theorem 7.2.5, Definition 7.4.2, Example 7.4.9):
  - The group is a **Noohi group**, in general not an inverse limit of discrete groups; Example 7.4.9 distinguishes it from its prodiscrete completion. The finding's "prodiscrete" is therefore wrong.
  - Geometric unibranchness is a sufficient condition for agreement with the SGA1 group, not a hypothesis for constructing the group.
  - A torsor does not give a canonical bare homomorphism. The correspondence is a groupoid equivalence, up to conjugation, or a pointed version after trivializing the fibre.

### Edit for the maintainer

README: insert after line 25 (the end of IG.0), before `<a id="ig-1"></a>`.

```markdown
<a id="ig-0a"></a>
## IG.0a. The pro-étale fundamental group

**Dependencies:** `InverseGaloisAndArithmeticFundamentalGroups:IG.0`; `SchemeAndStackFoundations:SF.2`; `EnhancedDerivedSheaves:E2` (repleteness and descent, only where used).

**Construction:** Develop tame infinite Galois categories and their fundamental groups as Noohi groups (Bhatt–Scholze, *The pro-étale topology for schemes*, §7.1–7.2, Definition 7.1.1 and Theorem 7.2.5). For a connected, locally topologically noetherian scheme S with geometric point x̄, construct π_1^proét(S, x̄) as the automorphism group of the fibre functor on locally constant sheaves of sets on S_proét (Definition 7.4.2), a Noohi group, not in general an inverse limit of discrete groups (Example 7.4.9 separates it from its prodiscrete completion). Reuse Mathlib's pro-étale site (`Scheme.ProEt`, `Scheme.ProEt.topology`, `Scheme.proetaleTopology`) and SF.2's comparison interface; do not rebuild the site. Prove that its profinite completion is IG.0's π_1(S, x̄) of finite étale covers, and that the two agree when S is geometrically unibranch (a sufficient condition for agreement, not a hypothesis for the construction). For a topological group G (such as J_b(Q_p)), state the correspondence between G-torsors on S_proét and continuous homomorphisms π_1^proét(S, x̄) → G as an equivalence of groupoids, with homomorphisms taken up to conjugation by G, or as a pointed equivalence after a chosen trivialization of the fibre at x̄. Do not assert a canonical homomorphism attached to an unframed torsor.

**Acceptance:** Recover IG.0's group by profinite completion. Give a non-unibranch example where π_1^proét is not profinite (Bhatt–Scholze Example 7.4.9). Check the torsor–homomorphism dictionary on a trivial and a nontrivial locally constant torsor, including the change of trivialization.
```

**Consequence for the records (a note).** PAPER-CARAIANI-SCHOLZE-17 route 13 should target `InverseGaloisAndArithmeticFundamentalGroups:IG.0a`, not IG.0, once the stage exists. The item's statement should be read with the groupoid form of the correspondence.

**Kept.**
- IG.0's finite-cover construction, which is not silently widened.
- EnhancedDerivedSheaves E2's ownership of repleteness, which is imported, not rebuilt.

## /2 (medium, missing): the normal-subgroup theorem for absolute Galois groups has no owner

### What was checked

- **IG.2** (README lines 36–43) proves "Hilbert irreducibility over number fields" and the specialization, avoidance and linear-disjointness variants. Its contract does not supply the theorem that the absolute Galois group of a Hilbertian field has no nontrivial finitely generated closed normal subgroup, or its proof.
- **The consumer is PAPER-SCHMIDT-STIX-16/36.** "Finitely generated extensions of Q are Hilbertian, and the absolute Galois group of a Hilbertian field has no nontrivial finitely generated closed normal subgroup (Fried–Jarden, *Field Arithmetic*, 3rd ed., Prop. 16.11.6)" (used in Theorem 7.1, published p. 850). Its route 3 to IG.2 is **rejected**, the extraction's verdict is `revise`, and its gap G2 already records this obligation: "Read FJ08 16.11.6 and the needed Weissauer argument with exact field hypotheses …".
- **Corrections to the finding's premise.** The extraction is not accepted, and the obligation is not new; it is G2. The other extraction's tag (PAPER-BRESCIANI-24, item /119) plans Hilbertian fields and thin sets, not this theorem. It is a valid narrow tag and is kept.
- **The finding's logical claim.** "Hilbert irreducibility does not imply it" is replaced by the precise fact: IG.2's current contract does not supply this further consequence or its proof.
- **Sources.** The review checked Mochizuki (2006) Theorem 2.4, pp. 62–63, which gives a number-field Galois-extension version under its no-cyclic-degree-p hypothesis with the Weissauer-based argument. Fried–Jarden 16.11.6 has not been read, so the unrestricted Hilbertian-field formulation is not certified.

### Edit for the maintainer (one option; the ownership decision stays with the maintainer)

The review says a new stage or a Part II is an option for the maintainer, not an established owner. It also says that a source-checked contract must settle the hypotheses before Schmidt–Stix's route is accepted.

A new stage after IG.2 is the natural option, because IG.2 already owns Hilbertian fields over number fields. README: insert after line 43 (the end of IG.2), before `<a id="ig-3"></a>`.

```markdown
<a id="ig-2a"></a>
## IG.2a. Finitely generated normal subgroups of absolute Galois groups

**Dependencies:** `InverseGaloisAndArithmeticFundamentalGroups:IG.2`; `FoundationsAndLibraryIntegration:LI.4`.

**Construction:** Prove that for K a finitely generated extension of Q — the fields used by Schmidt–Stix, Theorem 7.1 — the absolute Galois group G_K has no nontrivial topologically finitely generated closed normal subgroup. First read Fried–Jarden, *Field Arithmetic* (3rd ed.), Proposition 16.11.6 and the Weissauer theorem it uses, and state their exact field hypotheses. State the general Hilbertian-field version only if that source proves it, and keep the number-field argument (Mochizuki 2006, Theorem 2.4, with its own hypothesis on cyclic degree-p extensions) as a separately qualified statement. Reuse IG.2's Hilbertian-field and specialization results; this stage adds the Galois-group consequence and its proof, which IG.2's contract does not supply.

**Acceptance:** The finitely-generated-over-Q case is proved from the read sources with every hypothesis stated. Record the exact scope of the general statement.
```

**Consequences for the records (notes).**
- PAPER-SCHMIDT-STIX-16 route 3 can be re-targeted to IG.2a once the stage exists and the sources are read (gap G2).
- Naming an owner does not accept the rejected route, which goes through the extraction's revision and review.
- The Bresciani tag is unchanged.

**Kept.** IG.2's ordinary Hilbert irreducibility contract. No claim is made that the unrestricted Hilbertian formulation is certified.
