# Mistakes in Česnavičius, *Purity for the Brauer group*

Original job ERRATA-PAPER-CESNAVICIUS-19: Claude Code, session `cc-fb70e5`, 22 September 2026. Independent review REV-ERRATA-PAPER-CESNAVICIUS-19: Codex, session `codex-hjdg0j`, 23 September 2026. One finding, **confirmed as a proof gap in the accessible manuscripts**. The JSON beside this file contains the verdict.

## Versions and scope

The paper appeared in Duke Mathematical Journal 168 (2019), 1461–1486, [DOI](https://doi.org/10.1215/00127094-2018-0057). Freshly read: [arXiv v4](https://arxiv.org/pdf/1711.06456v4), latest version dated 1 December 2018, §2 pp.3–6; and the corresponding passage in the author manuscript dated 27 November 2018. The [old author PDF](https://www.imo.universite-paris-saclay.fr/~kestutis.cesnavicius/brauer-purity.pdf) and [current author PDF](https://webusers.imj-prg.fr/~kestutis.cesnavicius/brauer-purity.pdf) are byte-identical. Full hashes and source-reading limits are in the review report. The journal version was not collated: Project Euclid returned HTML challenges rather than its article/PDF. This finding must not be read as certification of the published wording.

The current author publication list links no correction for this paper; the latest arXiv version retains the passage. Crossref records no update, and exact-title erratum/correction searches found none on 23 September 2026. This bounds the designation “new”.

## E1. Noncommutative injectivity in Proposition 2.2

Under a finite flat map R→R′ of local rings, an open V⊂Spec R with Γ(V,O)=R, and an affine smooth R-group G with every G-torsor over R trivial, Proposition 2.2 asserts full injectivity of H¹(V,G)→H¹(V_R′,G).

Set H=Res_{R′/R}(G_R′) and X=H/G. Lemma 2.1 makes X affine. The proof uses X(R)=X(V) and triviality of R-torsors to show H(V)→X(V) is onto, then asserts injectivity of H¹(V,G)→H¹(V,H). The subsequent restriction-of-scalars identification does not address the problem with this implication.

The boundary sequence identifies the **neutral fibre** with H(V)\X(V). To describe the fibre through a G-torsor P, one must instead twist: it is (^P H)(V)\(^P X)(V). The group twists use conjugation; on H/G the induced action agrees with left multiplication by G. The distinguished coset gives a section of ^P X. For this fibre to be a singleton, the map (^P H)(V)→(^P X)(V) must be onto. The twists are initially over V, and no extension of them to affine R-schemes is established. If P extended to R, it would already be trivial by the assumption on R-torsors. Thus the argument does not cover the remaining fibres.

This formula can be checked directly from reductions of the extended H-torsor: sections of its H/G-bundle give G-reductions, and two give isomorphic G-torsors exactly when related by an automorphism of the H-torsor. It is also explicit in [Serre, *Galois Cohomology*](https://www.math.tau.ac.il/~borovoi/courses/Galois/Limud1.pdf), I.§5.3 Proposition 35 and **§5.4** Proposition 36, Corollaries 1–2, pp.49–51. The inherited report incorrectly cited §5.5 Corollary 2, which concerns the other map arising from a normal subgroup. This citation has been corrected; it is an error in the report, not a second error in Česnavičius's paper. The paper's own Giraud citation was not available for direct reading.

For a concrete diagnostic of the logical distinction, let C₂ act trivially on D₈=⟨(1234),(24)⟩⊂S₄. H¹(C₂,D₈) consists of four conjugacy classes of involutions including the identity. The neutral fibre in H¹(C₂,S₄) is a singleton, but (13)(24) and (14)(23), nonconjugate in D₈, become conjugate in S₄. This is a counterexample to the formal implication about pointed sets, **not** to Proposition 2.2 with its geometric hypotheses.

## Repairs and reach

Two conclusions follow from the argument already printed:

- Restrict to commutative G to retain full injectivity: H is then commutative too, and the map on H¹ is a group homomorphism with zero kernel.
- Retain general G and assert only that the fibre over the trivial torsor is trivial.

To retain full injectivity for general G, a proof of all the twisted surjectivity assertions is missing. No falsity of the geometric statement is claimed.

The two uses of Proposition 2.2 are in Proposition 2.3, for the commutative group Res(T)/T, and Corollary 2.4, for the torus T. Both are covered by the first repair. Consequently this gap does not obstruct those uses or the purity arguments downstream; this is not a new certification of all other parts of the paper.
